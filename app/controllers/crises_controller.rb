class CrisesController < ApplicationController
  before_action :set_crisis, only: [:show, :edit, :update, :destroy]

  # GET /crises
  # GET /crises.json
  def index
    @crises = Crisis.all
  end

  # GET /crises/1
  # GET /crises/1.json
  def show
  end

  # GET /crises/new
  def new
    @crisis = Crisis.new
  end

  # GET /crises/1/edit
  def edit
  end

  # POST /crises
  # POST /crises.json
  def create
    @crisis = Crisis.new(crisis_params)
    @crisis.user = current_user

    respond_to do |format|
      if @crisis.save
        format.html { redirect_to @crisis, notice: 'Crisis was successfully created.' }
        format.json { render :show, status: :created, location: @crisis }
      else
        format.html { render :new }
        format.json { render json: @crisis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crises/1
  # PATCH/PUT /crises/1.json
  def update
    respond_to do |format|
      if @crisis.update(crisis_params)
        format.html { redirect_to @crisis, notice: 'Crisis was successfully updated.' }
        format.json { render :show, status: :ok, location: @crisis }
      else
        format.html { render :edit }
        format.json { render json: @crisis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crises/1
  # DELETE /crises/1.json
  def destroy
    @crisis.destroy
    respond_to do |format|
      format.html { redirect_to crises_url, notice: 'Crisis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crisis
      @crisis = Crisis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crisis_params
      params.require(:crisis).permit(:name, :country, :date)
    end
end
