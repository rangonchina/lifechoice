class User::ThemesController < ApplicationController
    
    def theme_index
        @goal = Goal.all
    end
    
end