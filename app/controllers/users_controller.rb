class UsersController < ApplicationController
	def show
    	#@user = User.find_by(params[:id]) # ここを記述
			if  params[:id].present?
				@user = User.find_by(params[:id])
			else
				@user = current_user
			end
    	@books = @user.books
		  @book = Book.new
    		#user_id: @current_user.id
    		#@がないとローカル変数
	end



 	def index
 		@user = User.find_by(params[:id]) # ここを記述
		@books = @user.books
		@book = Book.new
		@users  =  User.all
	end

	def create
  		@user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
 		if @user.save
    		flash[:success] = '新しいユーザーを登録しました。'
    		redirect_to @user
  		else
    		flash.now[:danger] = 'ユーザーの登録に失敗しました。'
    		render :new
  		end
  	end

 	 def edit
        @user = User.find(params[:id])
    end

    def update
    	user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user.id)
	end
private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
