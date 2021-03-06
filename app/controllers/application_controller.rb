class ApplicationController < ActionController::Base
    include Knock::Authenticable

    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    
    #exception handling...
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed

    protected

    def record_not_found(ex)
        render json: { error: ex.message }, status: :unprocessable_entity
    end
    
    def record_not_destroyed(ex)
        render json: { errors: ex.record.errors }, status: :unprocessable_entity
    end
end
