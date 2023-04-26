class User::ThemesController < ApplicationController
    
    def index
        @goal = Goal.all
    end
    
end