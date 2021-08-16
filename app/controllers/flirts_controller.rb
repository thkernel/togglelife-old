class FlirtsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_flirt, only: [:show, :edit, :update, :destroy]

  # GET /flirts
  # GET /flirts.json
  def index
    @flirts = Flirt.all
  end

  # GET /flirts/1
  # GET /flirts/1.json
  def show
  end

  # GET /flirts/new
  def new
    @flirt = Flirt.new
  end

  # GET /flirts/1/edit
  def edit
  end

  def send_flirt
    recipient = User.find_by(slug: params[:slug])
    if recipient.present?
      flirt = Flirt.new
      flirt.recipient_id = recipient.id
      flirt.sender_id = current_user.id
      flirt.save

      if flirt.save
        redirect_to show_his_profile_path(recipient.slug)
      end
    end
  end

  # POST /flirts
  # POST /flirts.json
  def create
    @flirt = Flirt.new(flirt_params)

    respond_to do |format|
      if @flirt.save
        format.html { redirect_to @flirt, notice: 'Flirt was successfully created.' }
        format.json { render :show, status: :created, location: @flirt }
      else
        format.html { render :new }
        format.json { render json: @flirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flirts/1
  # PATCH/PUT /flirts/1.json
  def update
    respond_to do |format|
      if @flirt.update(flirt_params)
        format.html { redirect_to @flirt, notice: 'Flirt was successfully updated.' }
        format.json { render :show, status: :ok, location: @flirt }
      else
        format.html { render :edit }
        format.json { render json: @flirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flirts/1
  # DELETE /flirts/1.json
  def destroy
    @flirt.destroy
    respond_to do |format|
      format.html { redirect_to flirts_url, notice: 'Flirt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flirt
      @flirt = Flirt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flirt_params
      params.require(:flirt).permit(:sender_id, :recipient_id, :status)
    end
end
