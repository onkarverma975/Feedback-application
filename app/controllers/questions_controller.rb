class QuestionsController < ApplicationController
	def create
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.create(question_params)
		redirect_to new_survey_question_path(survey_id: @survey.id)
	end
	def new
		@question = Question.new
		@survey = Survey.find(params[:survey_id])
	end
	def destroy
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.find(params[:id])
		@question.destroy
		redirect_to survey_path(@survey)
	end
	private
	def question_params
		params.require(:question).permit(:body,:num_of_op,:need_mul)
	end
end
