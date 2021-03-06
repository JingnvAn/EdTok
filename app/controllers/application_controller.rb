class ApplicationController < ActionController::Base
    def hello
        render html: "Welcome to EdTok!"
    end
end
