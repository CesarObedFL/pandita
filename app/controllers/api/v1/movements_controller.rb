module Api
    module V1
        class MovementsController < ApplicationController
            # actions only permited by authenticated users
            before_action :authenticate_user
            
            #api/v1/movements#index (get)
            def index 
                render json: Movement.all
            end

            #api/v1/movements#show (get - :id)
            # show all the movements of one user by id
            def show
                movements = User.find(params[:id]).movements # obtain records using the relation
                render json: movements, status: :ok
            end

            #api/v1/movements#create (post)
            # use the user_id to find and create a record in movement
            def create
                movement = User.find(params['user_id']).movements.new(movement_params) # create records using the relation
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