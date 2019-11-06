module Api
  module V1
    class MappingsController < ApplicationController
      def index
		print '\n\nINDEX CALLED>>>'
        mappings = Mapping.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded mappings', data:mappings},status: :ok
      end

      def show
		print '\n\nGET CALLED>>>'
        mapping = Mapping.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded mapping', data:mapping},status: :ok
      end

      def create
		print 'POST >>>>>>'
        mapping = Mapping.new(mapping_params)

        if mapping.save
          render json: {status: 'SUCCESS', message:'Saved mapping', data:mapping},status: :ok
        else
          render json: {status: 'ERROR', message:'Mapping not saved', data:mapping.errors},status: :unprocessable_entity
        end
      end

      def destroy
		print '\n\nDELETE CALLED>>>'
        mapping = Mapping.find(params[:id])
        mapping.destroy
        render json: {status: 'SUCCESS', message:'Deleted mapping', data:mapping},status: :ok
      end

      def update
		print '\n\nUPDATE CALLED>>>'
        mapping = Mapping.find(params[:id])
        if mapping.update_attributes(mapping_params)
          render json: {status: 'SUCCESS', message:'Updated mapping', data:mapping},status: :ok
        else
          render json: {status: 'ERROR', message:'Mapping not updated', data:mapping.errors},status: :unprocessable_entity
        end
      end

      private

      def mapping_params
		print '\n\nPaRAMS>>>'
        params.permit(:mapping, :mappings, :mapping_id)
      end
    end
  end
end
