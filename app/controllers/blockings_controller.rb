class BlockingsController < ApplicationController
  before_action :set_blocking, only: [:show, :edit, :update, :destroy]

  # GET /blockings
  # GET /blockings.json
  def index
    @blockings = Blocking.all
  end

  # GET /blockings/1
  # GET /blockings/1.json
  def show
  end

  # GET /blockings/new
  def new
    @blocking = Blocking.new
  end

  # GET /blockings/1/edit
  def edit
  end

  # POST /blockings
  # POST /blockings.json
  def create
    @blocking = Blocking.new(blocking_params)

    respond_to do |format|
      if @blocking.save
        format.html { redirect_to @blocking, notice: 'Blocking was successfully created.' }
        format.json { render :show, status: :created, location: @blocking }
      else
        format.html { render :new }
        format.json { render json: @blocking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blockings/1
  # PATCH/PUT /blockings/1.json
  def update
    respond_to do |format|
      if @blocking.update(blocking_params)
        format.html { redirect_to @blocking, notice: 'Blocking was successfully updated.' }
        format.json { render :show, status: :ok, location: @blocking }
      else
        format.html { render :edit }
        format.json { render json: @blocking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blockings/1
  # DELETE /blockings/1.json
  def destroy
    @blocking.destroy
    respond_to do |format|
      format.html { redirect_to blockings_url, notice: 'Blocking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocking
      @blocking = Blocking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blocking_params
      params.require(:blocking).permit(:sender_id, :recipient_id, :status)
    end
end
