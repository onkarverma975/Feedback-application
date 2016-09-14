class SurveysController < ApplicationController
	def new
		@survey = Survey.new
	end
	def create
		@survey = Survey.new(survey_params)
		if @survey.save
			redirect_to new_survey_question_path(survey_id: @survey.id)
		else
			render 'new'
		end
	end
	def show 
		@survey = Survey.find(params[:id])
	end
	def edit
		@survey = Survey.find(params[:id])
	end
	def index
		@surveys = Survey.all
	end
	def destroy
		@survey = Survey.find(params[:id])
		@survey.destroy
		redirect_to surveys_path
	end
	def update
		@survey = Survey.find(params[:id])
		if @survey.update(survey_params)
			redirect_to @survey
		else
			render 'edit'
		end
	end
		private
		def survey_params
			params.require(:survey).permit(:heading, :num_of_q)
		end
end