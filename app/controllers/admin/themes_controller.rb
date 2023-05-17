class Admin::ThemesController < ApplicationController
  
   
    def theme_index
        @goal = Goal.all
        render '/user/themes/theme_index'
    end
    
    # def create
    #     # DBへの保存処理
    # end
    
    # # 削除ボタン
    #  def destroy
    #     theme = Theme.find(params[:id])
    #     theme.destroy
    #     redirect_to  admin_admins_themes_path, notice: "テーマを削除しました。"
    #  end
    
end
