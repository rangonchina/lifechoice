class Admin::ThemesController < ApplicationController
  
   
    def theme_index
        @goal = Goal.all
        render '/user/themes/theme_index'
    end
    
    #削除ボタン
    # def destroy
    #     @goal = Goal.find(params[:id])
    #     post.destroy
    #     redirect_to  admin_admins_themes_paht, notice: "投稿を削除しました。"
    # end
    
end
