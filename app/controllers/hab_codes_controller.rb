class HabCodesController < ApplicationController
  before_action :set_hab_code, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /hab_codes
  # GET /hab_codes.json
  def index
    if params[:search]
      @assigned = HabCode.assigned(sort_terms, params[:search]).paginate(:per_page => 2, :page => params[:page])
      @unassigned = HabCode.unassigned(sort_terms, params[:search]).paginate(:per_page => 2, :page => params[:page])
    else
      @assigned = HabCode.assigned(sort_terms, params[:search]).paginate(:per_page => 2, :page => params[:page])
      @unassigned = HabCode.unassigned(sort_terms, params[:search])
    end
  end

  # GET /hab_codes/1
  # GET /hab_codes/1.json
  def show
  end

  # GET /hab_codes/new
  def new
    @hab_code = HabCode.new
  end

  # GET /hab_codes/1/edit
  def edit
  end

  # POST /hab_codes
  # POST /hab_codes.json
  def create
    @hab_code = HabCode.new(hab_code_params)

    respond_to do |format|
      if @hab_code.save
        format.html { redirect_to @hab_code, notice: 'Hab code was successfully created.' }
        format.json { render :show, status: :created, location: @hab_code }
      else
        format.html { render :new }
        format.json { render json: @hab_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hab_codes/1
  # PATCH/PUT /hab_codes/1.json
  def update
    respond_to do |format|
      if @hab_code.update(hab_code_params)
        format.html { redirect_to @hab_code, notice: 'Hab code was successfully updated.' }
        format.json { render :show, status: :ok, location: @hab_code }
      else
        format.html { render :edit }
        format.json { render json: @hab_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hab_codes/1
  # DELETE /hab_codes/1.json
  def destroy
    @hab_code.destroy
    respond_to do |format|
      format.html { redirect_to hab_codes_url, notice: 'Hab code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hab_code
      @hab_code = HabCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hab_code_params
      params.require(:hab_code).permit(:code, :last_name, :first_name, :email, :date_sent, :registered, :assigned, :completed, :debriefed, :report_sent, :coach_id)
    end
    
    def sort_column
      HabCode.column_names.include?(params[:sort])? params[:sort] : "code"
    end

    def sort_direction
      %w[asc, desc].include?(params[:direction])? params[:direction] : "asc"
    end

    def sort_terms
      sort_column + " " + sort_direction
    end
end
