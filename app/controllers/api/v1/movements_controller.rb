module Api
    module V1
        class MovementsController < ApplicationController
            before_action :authenticate_user
            #skip_before_action :verify_authenticity_token
            
            #api/v1/movements#index (get)
            def index 
                render json: Movement.all
            end

            #api/v1/movements#show (get - :id)
            # show all the movements of one user by id
            def show
                movements = Movement.find(params[:id]).user.movements
                render json: movements, status: :ok
            end

            #api/v1/movements#create (post)
            # use the user_id to find and create a record in movement
            def create
                movement = User.find(params['user_id']).movements.new(movement_params)
                if movement.save
                    render json: movement, status: :created
                else
                    render json: movement.errors, status: :unprocessable_entity
                end
            end

            private
            def movement_params
                params.permit(:user_id, :operation, :destinationAccount, :amount)
            end
        end
    end
end