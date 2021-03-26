class ApplicationController < ActionController::Base
    include SessionsHelper
    
    def hello
        render html: "Welcome to EdTok!"
    end
end
