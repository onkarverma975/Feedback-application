class OptionsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@survey = Survey.find(params[:survey_id])
		@option = @question.options.create(option_params)
		redirect_to new_survey_question_option_path(survey_id: @survey.id,question_id: @question.id)
	end
	def new
		@option = Option.new
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
	end
	def edit
		@option = Option.find(params[:id])
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
	end
	def update
		@option = Option.find(params[:id])
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
		if @option.update(option_params)
			redirect_to question_path(id: @question.id)
		else
			render 'edit'
		end
	end
	def show
		@option = Option.find(params[:id])
	end
	def destroy
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
		@option = @question.options.find(params[:id])
		@option.destroy
		redirect_to question_path(@question)
	end
	private
	def option_params
		params.require(:option).permit(:value)
	end
end
