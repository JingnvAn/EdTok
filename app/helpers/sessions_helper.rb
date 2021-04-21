module SessionsHelper

    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # Returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user
    def log_out 
        reset_session
        @current_user = nil
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
        user && user == current_user
    end

    # Stores the URL trying to be accessed.
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
