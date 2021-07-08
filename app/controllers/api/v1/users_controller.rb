module Api 
    module V1
        class UsersController < ApplicationController
            skip_before_action :verify_authenticity_token # to test the api, we skip the auth token...
            
            #api/v1/users#index (get)
            def index
                render json: User.all
            end
            
            #api/v1/users#show (get - :id)
            def show
                user = User.find(params[:id])
                render json: user, status: :ok
            end

            #api/v1/users#create (post)
            def create
                user = User.new(user_params)
                user.accountNumber = rand(1000..9999) # set the random account number, needs to check db to be unique
                if user.save
                    # create the initial gift deposit
                    Movement.new(user_id: user.id, operation: "deposit", destinationAccount: "", amount: 1000).save
                    render json: user, status: :created
                else
                    render json: user.errors, status: :unprocessable_entity
                end
            end

            #api/v1/users#update (put/patch - :id)
            def update
                user = User.find(params[:id]).update!(user_params)
                head :no_content
            end

            #api/v1/users#destroy (delete - :id)
            def destroy
                User.find(params[:id]).destroy!             
                head :no_content
            end
            
            private
            def user_params
                params.permit(:name, :email, :age, :phone)
            end
        end
    end
end