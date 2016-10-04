class SurveyResponsesController < ApplicationController
  before_action :set_survey_response, only: [:show, :edit, :update, :destroy]
  has_scope :survey_id
  has_scope :crisis_id
  # GET /survey_responses
  # GET /survey_responses.json
  def index
    @survey_responses = apply_scopes(SurveyResponse).includes([:user, :survey]).all
    @survey_response_filter = SurveyResponseFilter.new()
    @survey_response_filter.assign_attributes({
      survey_id: params[:survey_id],
      crisis_id: params[:crisis_id]
    })

    # @bar_chart_data = []
    # groups = []
    # QuestionResponse.question_id(36).group_by {|qr| qr.participant_type }.each do |group, questions| 
    #   groups << group
    #   @bar_chart_data << [group, questions.size]
    # end
    # # puts "test"
    # @bar_chart_data.unshift(groups)

    # puts @bar_chart_data

    # @lines = @survey_responses.map { |sr| 
    #   [[sr.survey.name, sr.participant_type, sr.participant_id] + sr.question_responses.map { |q| q.answer.to_i }].flatten
    # }

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"survey-responses.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end

  end

  # GET /survey_responses/1
  # GET /survey_responses/1.json
  def show
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new
  end

  # GET /survey_responses/1/edit
  def edit
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    @survey_response.user = current_user

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to edit_survey_response_path(@survey_response), notice: 'Survey response was successfully created.' }
        format.json { render :show, status: :created, location: @survey_response }
      else
        format.html { render :new }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_responses/1
  # PATCH/PUT /survey_responses/1.json
  def update
    respond_to do |format|
      if @survey_response.update(survey_response_params)
        format.html { redirect_to @survey_response, notice: 'Survey response was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response }
      else
        format.html { render :edit }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_responses/1
  # DELETE /survey_responses/1.json
  def destroy
    @survey_response.destroy
    respond_to do |format|
      format.html { redirect_to survey_responses_url, notice: 'Survey response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit(
        :survey_id, 
        :crisis_id,
        :latitude,
        :longitude,
        :participant_id, 
        :participant_type, 
        :iteration,
        :date,
        :question_responses_attributes => [:id, :question_id, :answer])
    end
end
