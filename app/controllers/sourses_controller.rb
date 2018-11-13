class SoursesController < ApplicationController
  before_action :set_sourse, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /sourses
  # GET /sourses.json
  def index
    @sourses = Sourse.all.order(created_at: :desc)
  end

  # GET /sourses/1
  # GET /sourses/1.json
  def show
  end

  # GET /sourses/new
  def new
    @sourse = Sourse.new
  end

  # GET /sourses/1/edit
  def edit
  end

  # POST /sourses
  # POST /sourses.json
  def create
    @sourse = Sourse.new(sourse_params)

    respond_to do |format|
      if @sourse.save
        format.html { redirect_to @sourse, notice: 'Sourse was successfully created.' }
        format.json { render :show, status: :created, location: @sourse }
      else
        format.html { render :new }
        format.json { render json: @sourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sourses/1
  # PATCH/PUT /sourses/1.json
  def update
    respond_to do |format|
      if @sourse.update(sourse_params)
        format.html { redirect_to @sourse, notice: 'Sourse was successfully updated.' }
        format.json { render :show, status: :ok, location: @sourse }
      else
        format.html { render :edit }
        format.json { render json: @sourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sourses/1
  # DELETE /sourses/1.json
  def destroy
    @sourse.destroy
    respond_to do |format|
      format.html { redirect_to sourses_url, notice: 'Sourse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sourse
      @sourse = Sourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sourse_params
      params.require(:sourse).permit(:value, :kind, :number, :date_of, :reason_id, :comment, :kind1 )
    end
end
