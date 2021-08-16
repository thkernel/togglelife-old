class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :profile_thumbnail,:update_profile_thumbnail, :profile_presentation, :update_profile_presentation,:profile_informations, :update_profile_informations]
 # This controller is reserved for all user authenticate users
 before_action :authenticate_user!
    
 layout "profile"
  # GET /profiles
  # GET /profiles.json
  def index
    #@profiles = Profile.all
    @users = User.where.not(id: current_user.id).order(created_at: 'DESC').paginate(:page => params[:page], :per_page => 8)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  def show_my_profile
  end

  def show_his_profile
    @user = User.find_by(slug: params[:slug])
  end

  def profile_presentation
  end
  def update_profile_presentation
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to show_my_profile_path(current_user.slug), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def profile_informations
    #@user = User.find_by(slug: params[:slug])
  end

  def profile_thumbnail
    #@user = User.find_by(slug: params[:slug])
  end

  def update_profile_thumbnail
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to show_my_profile_path(current_user.slug), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update_profile_informations
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to show_my_profile_path(current_user.slug), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_profile
      user = User.find_by(slug: params[:slug])
      @profile = user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :gender, :birth_date, :full_address, :about, :marital_status, :cut, :weight, :eyes, :hair, :sexual_orientation, :occupation, :astrology, :region, :nationality, :purpose, :presentation, :avatar)
    end
end
