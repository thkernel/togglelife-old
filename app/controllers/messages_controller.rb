class MessagesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_recipient, only: [:new, :create]

	layout "profile"
	

	def index
		
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

		 
		puts "CONVERSATIONS USERS: #{@conversations_list.inspect}"
	 	
	end

	def new
		
		@message = Message.new
	end

	
	# Show
	 def show
	

		@message = Message.new
		user = User.find_by(slug: params[:slug])
		if user.present?
		conversation = find_conversation(user.id)

			if conversation.recipient_id != current_user.id 
				@recipient_id = User.find(conversation.recipient_id).slug
			elsif conversation.sender_id != current_user.id 
				@recipient_id = User.find(conversation.sender_id).slug
			end

			@messages = conversation.messages
		end
 			
	end

	def create
		puts "RECIPIENT INTERNE: #{params[:recipient_id]}"
		user = User.find_by(slug: params[:recipient_id])
		if user.present?
			recipient_id = user.id
			@conversation = find_conversation(recipient_id) || Conversation.create(sender_id: current_user.id, recipient_id: recipient_id)

			#Create message
			@message = @conversation.messages.build(message_params)
			@message.user_id = current_user.id
			
			if @message.save
				redirect_to show_messages_path(@message.identifier, user.slug)
			else  
				puts "MESSAGE NON CREATE"
			end
		end
	    
	 end

	private
	  def message_params
	    params.require(:message).permit(:body)
	  end
		
		def find_conversation(recipient_id)
			conversations = Conversation.current_user_conversations(current_user.id)
			if conversations.present?
				conversation = conversations.where(["recipient_id = ? OR sender_id = ?", recipient_id, recipient_id]).take
			end
		end

		def set_recipient
			if params[:recipient_id].present?
				@recipient_id = params[:recipient_id]
				
			end
		  
		end
	


end