module Api
  module V1
    class QuestionsController < ApplicationController
      def index
		print '\n\nINDEX CALLED>>>'
        questions = Question.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded questions', data:questions},status: :ok
      end

      def show
		print '\n\nGET CALLED>>>'
        question = Question.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded question', data:question},status: :ok
      end

      def create
		print 'POST >>>>>>'
		puts params
		if params[:mapping]
			mapping = Mapping.find_or_create_by(mapping_str: params[:mapping])
			mapping.save
			params[:mapping_id] = mapping.id
		end
        
		if params[:role]
			role = Role.find_or_create_by(role_str: params[:roles])
			role.save
			params[:role_id] = role.id
		end

        question = Question.new(question_params)

        if question.save
          render json: {status: 'SUCCESS', message:'Saved question', data:question},status: :ok
        else
          render json: {status: 'ERROR', message:'Question not saved', data:question.errors},status: :unprocessable_entity
        end
      end

      def destroy
		print '\n\nDELETE CALLED>>>'
        question = Question.find(params[:id])
        question.destroy
        render json: {status: 'SUCCESS', message:'Deleted question', data:question},status: :ok
      end

      def update
		print '\n\nUPDATE CALLED>>>'
        question = Question.find(params[:id])
        if question.update_attributes(question_params)
          render json: {status: 'SUCCESS', message:'Updated question', data:question},status: :ok
        else
          render json: {status: 'ERROR', message:'Question not updated', data:question.errors},status: :unprocessable_entity
        end
      end

      private

      def question_params
		print '\n\nPaRAMS>>>'
        params.permit(:pri, :quiz, :question, :teamingStages, :appearsDay, :frequency,  :qType,  :required,  :conditions,  :mappings, :mapping_id, :roles, :role_id)
      end
    end
  end
end
