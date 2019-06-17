class UsersController < ApplicationController
    before_action :authenticate_user!
	def show
    	#@user = User.find_by(params[:id]) # ここを記述
			# if  params[:id].present?
			# 	@user = User.find_by(params[:id])
			# else
			# 	@user = current_user
			# end
    	# @books = @user.books
		  @book = Book.new
      @user = User.find(params[:id])
    		#user_id: @current_user.id
    		#@がないとローカル変数
	end



 	def index
 		#@user = current_user # ここを記述
		#@books = @user.books
		@book = Book.new
		@users  =  User.all
    #@user = User.find_by(params[:id])これいるような気がするんだが
	end

	def create
  		@user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
 		if @user.save
    		flash[:success] = '新しいユーザーを登録しました。'
    		redirect_to @user#これがすべてuedaになっている
  		else
    		flash.now[:danger] = 'ユーザーの登録に失敗しました。'
    		render :new
  		end
  	end

 	 def edit
        @user = User.find(params[:id])
    end

    def update#わからん
    	@user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        redirect_to user_path
      else
        #flash.now[:danger] = 'ユーザーの登録に失敗しました。'
        puts @user.errors.full_messages
        render :edit
	     end
    end

  def use_before_action?
    true
  end
private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
