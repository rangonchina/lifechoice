class User::ThemesController < ApplicationController
    
    def index
        @goal = Goal.all
    end
    
    def show
        @goal = Goal.find(params[:id])  
    end
    
end