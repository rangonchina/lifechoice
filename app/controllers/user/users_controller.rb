class User::UsersController < ApplicationController
  
    def show
        @user = current_user
    end
    
       # 登録情報編集へのアクション
    def edit
        @user = current_user
    end

    # 登録情報の編集を保存するアクション
    def update
        @user = current_user
        if @user.update(customer_params)
           flash[:success] = "登録情報を変更しました。"
           redirect_to user_path
        else
            render 'edit'
        end
    end
    
      private
    def user_params
        params.require(:user).permit(:name, :email, :gender, :age,)
    end
end
