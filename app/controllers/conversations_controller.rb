class ConversationsController < ApplicationController

	 before_action :authenticate_user!
	layout "profile"

	 def index
		@conversations = Conversation.current_user_conversations(current_user.id)#.where.not(["sender_id = ? OR recipicient_id = ?", current_user.id, current_user.id])
		
		@conversation_users = []
		
		@conversations.each do |conversation|
			if conversation.sender_id != current_user.id 
				user = User.find(conversation.sender_id)
				@conversation_users.push(user)
			end
			if  conversation.recipient_id != current_user.id 
				user = User.find(conversation.recipient_id)
				@conversation_users.push(user)
			end
		end

		 #@last_unread_conversation =  Conversation.my_conversation(current_user.id)
		 

	 end

	 def show 
		conversations = Conversation.current_user_conversations(current_user.id)
		@conversations_list = []

		conversations.each do |conversation|
			if conversation.sender_id != current_user.id 
				@conversations_list.push(User.find(conversation.sender_id))
			end
			if conversation.recipient_id != current_user.id 
				@conversations_list.push(User.find(conversation.recipient_id))
			end
		end
	 end

	def create
		# Check, if it's exist an conversation or not.
		 if Conversation.between(params[:sender_id],params[:recipient_id]).present?
		    @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
		 else
		 	# Create a new conversation before
		  	@conversation = Conversation.create!(conversation_params)

		 end
		 

		  # Create a new message with this conversation.
		 @conversation.messages.create!(message_params)

		 flash[:notice] = "Message envoyé avec succèss!"

		 # Send notification
        content = "Vous avez recu un nouveau message!"
        Notification.create(:content => content, :sender_id => params[:sender_id], :receiver_id => params[:recipient_id])


		 # Redirect to
		 redirect_to profil_path(u: params[:recipient_id])
	end

	# For Tchat
	def tchat
		# Retrieve Sender.
		sender = params[:sender_id] if params[:sender_id]
		
		# Retrieve recipient.
		recipient = params[:recipient_id] if params[:recipient_id]

		# Check conversation (if it exist)
		if Conversation.between(sender, recipient).present?

			#Stored the converation.
			@conversation = Conversation.between(sender,recipient).first

			#flash[:notice] = "Il existe déjà une conversation" if @conversation.present?


		else
			# Creating a new conversation between both.
			@conversation = Conversation.create!(conversation_params)
			flash[:notice] = "Nouvelle conversation créee" if @conversation.save
		end

		# Loading the messages of this conversation.
		@conversation_messages = @conversation.messages

		# Loading current user all conversations.
		@current_user_conversations = Conversation.current_user_conversations(current_user.id).order(:created_at => 'DESC')
	end

	# For reply.
	def reply
		conversation = Conversation.find(params[:conversation_id])
		conversation.messages.create!(message_params)
		#redirect_to conversations_path
		
	end

	# private methode zone. 
	private
	 def conversation_params
	  params.permit(:sender_id, :recipient_id)
	 end

	 def message_params
	 	params.permit(:body, :user_id)
	 end

end