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
    
    def withdrawal
        # @user = User.find(params[:id])
        # is_deletedカラムをtrueに変更することにより削除フラグを立てる
        current_user.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to root_path
    end
    
      private
    def user_params
        params.require(:user).permit(:name, :email, :gender, :age,)
    end
end
