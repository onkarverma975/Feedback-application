class QuestionsController < ApplicationController
	def create
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.create(question_params)
		redirect_to new_survey_question_option_path(survey_id: @survey.id, question_id: @question.id)
	end
	def new
		@question = Question.new
		@survey = Survey.find(params[:survey_id])
	end
	def edit
		@question = Question.find(params[:id])
		@survey = Survey.find(params[:survey_id])
	end
	def update
		@question = Question.find(params[:id])
		@survey = Survey.find(params[:survey_id])
		if @question.update(question_params)
			redirect_to survey_path(id: @survey.id)
		else
			render 'edit'
		end
	end
	def show 
		@question = Question.find(params[:id])
	end
	def destroy
		@survey = Survey.find(params[:survey_id])
		@question = @survey.questions.find(params[:id])
		@question.destroy
		redirect_to survey_path(@survey)
	end
	private
	def question_params
		params.require(:question).permit(:body,:need_mul)
	end
end
