
module Api
  module V1
    class RolesController < ApplicationController
      def index
		print '\n\nINDEX CALLED>>>'
        roles = Role.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded roles', data:roles},status: :ok
      end

      def show
		print '\n\nGET CALLED>>>'
        role = Role.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded role', data:role},status: :ok
      end

      def create
		print 'POST >>>>>>'

        role = Role.new(role_params)

        if role.save
          render json: {status: 'SUCCESS', message:'Saved role', data:role},status: :ok
        else
          render json: {status: 'ERROR', message:'Role not saved', data:role.errors},status: :unprocessable_entity
        end
      end

      def destroy
		print '\n\nDELETE CALLED>>>'
        role = Role.find(params[:id])
        role.destroy
        render json: {status: 'SUCCESS', message:'Deleted role', data:role},status: :ok
      end

      def update
		print '\n\nUPDATE CALLED>>>'
        role = Role.find(params[:id])
        if role.update_attributes(role_params)
          render json: {status: 'SUCCESS', message:'Updated role', data:role},status: :ok
        else
          render json: {status: 'ERROR', message:'Role not updated', data:role.errors},status: :unprocessable_entity
        end
      end

      private

      def role_params
		print '\n\nPaRAMS>>>'
        params.permit(:role, :roles, :role_id)
      end
    end
  end
end
