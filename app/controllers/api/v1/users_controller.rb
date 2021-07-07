module Api 
    module V1
        class UsersController < ApplicationController
            skip_before_action :verify_authenticity_token # to test the api, we skip the auth token...
            
            #api/v1/users#index (get)
            def index
                users = User.all;
                render json: {
                    status: 'success',
                    message: 'users loaded successfully...',
                    data: users
                }, status: :ok
            end
            
            #api/v1/users#show (get - :id)
            def show
                user = User.find(params[:id]);
                render json: {
                    status: 'success',
                    message: 'get user successfully...',
                    data: user
                }, status: :ok
            end

            #api/v1/users#create (post)
            def create
                user = User.new(user_params);
                if user.save
                    render json: {
                        status: 'success',
                        message: 'user created successfully...',
                        data: user
                    }, status: :ok #201 code
                else
                    render json: {
                        status: 'failed',
                        message: 'a problem has occurred...',
                        data: user.errors
                    }, status: :unprocessable_entity #422 code
                end
            end

            #api/v1/users#update (put/patch - :id)
            def update
                user = User.find(params[:id]);
                if user.update(user_params)
                    render json: {
                        status: 'success',
                        message: 'user updated successfully...',
                        data: user
                    }, status: :ok
                else
                    render json: {
                        status: 'failed',
                        message: 'a problem has occurred...',
                        data: user.errors
                    }, status: :unprocessable_entity
                end
            end

            #api/v1/users#destroy (delete - :id)
            def destroy
                user = User.find(params[:id]);
                if user.destroy
                    render json: {
                        status: 'success',
                        message: 'user removed successfully...',
                    }, status: :ok
                else
                    render json: {
                        status: 'failed',
                        message: 'a problem has occurred...',
                        data: user.errors
                    }, status: :unprocessable_entity
                end
            end
            
            private
            def user_params
                #accountNumber = rand(1000..9999);
                balance = 1000;
                params.permit(:accountNumber, :name, :email, :age, :phone, :balance)
            end
        end
    end
end