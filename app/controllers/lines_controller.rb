class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :my_edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /lines
  # GET /lines.json
  def index
    if params[:section_id].present?
      if User.current_role[0] == "Оператор"
        @lines = Line.includes(:reasons => :sourses).where('section_id = ? and filial_id = ?', params[:section_id].to_s, User.current_role[2]).page(params[:page]).order(created_at: :desc).per(10)
      else
        @lines = Line.includes(:reasons => :sourses).where('section_id = ?', params[:section_id].to_s).page(params[:page]).order(created_at: :desc).per(10)
      end
    else
      @lines = Line.includes(:reasons => :sourses).all.page(params[:page]).order(created_at: :desc).per(10)
    end
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  def my2_show
    @b = Section.first
    # @t1 = @b.lines.where('filial_id = ? and verification = ?',1,true).first
    @t2 = @b.lines.where('filial_id = ? and verification = ?',1,true)
    @goz,@pr,@ob,@v=0,0,0,0
    @mas = Array.new
    for i in 0 ... @t2.size
      @goz += @t2[i].mark
      @pr += @t2[i].recruitment
      @ob += @t2[i].studying
      @v += @t2[i].release
      if @t2[i].reasons
        r = @t2[i].reasons
        for j in 0 ... r.size
          @mas << r[j]
        end
      end
    end
    # @tmp = @t2[1].reasons.first.name   r[j].sourses,
    @fact = ((@pr * (1/3.0) + @ob * (1) - @v * (2/3.0))*10).ceil / 10.0
    @t1=@t2.first
    @mas.sort!
    @mas3 = Array.new
    for i in 0 .. @mas.size/2
      @mas3[i] = Array.new
      for j in i ... @mas.size
        if @mas[i].name == @mas[j].name
          @mas3[i] << @mas[j]
        end
      end
    end
    # @t1 = @t.sections.joins(:lines).where("filial_id" => 1)
  end

  def my_show
    @t = Task.last
    @a1 = @t.sections.joins(:lines).group("filial_id")
    a = @a1.count
    @b = @t.sections.joins(:lines).where("lines.verification" => true).group("filial_id").count

    a.keys.each{|k| @b[k] = [a[k], @b[k]]}
  end
  # GET /lines/new
  def new
    @line = Line.new
    if params[:section_id].present?
      @line.section_id = params[:section_id].to_s
    end
  end

  # GET /lines/1/edit
  def edit
  end

  # GET /lines/1/my_edit
  def my_edit
  end
  # POST /lines
  # POST /lines.json
  def create
    @line = Line.new(line_params)
    if params[:section_id].present?
      @line.section_id = params[:section_id].to_s
    end
    respond_to do |format|
      if @line.save
        format.html { redirect_to lines_url(:section_id => @line.section_id), notice: 'Line was successfully created.' }
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to lines_url(:section_id => @line.section_id), notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    tmp = @line.section_id
    @line.destroy
    respond_to do |format|
      format.html { redirect_to lines_url(:section_id => tmp), notice: 'Line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:registry_number, :period, :level, :specialty, :form_of_training, :ovz, :mark, :verification, :section_id, :recruitment, :studying, :release, :comment, :filial_id)
    end
end
