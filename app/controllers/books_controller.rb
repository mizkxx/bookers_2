class BooksController < ApplicationController
  before_action :authenticate_user!
 	def new
    	@book = Book.new
	end

	def index
		@books = Book.all
    	@book = Book.new
	end

	def show
		@book = Book.find_by(params[:id])
		@user = User.find_by(id: @post.user_id)
		#@user = @book.user # 投稿に紐付くユーザ情報を取得する(Postモデルで定義した関数)
	end

  def create# ストロングパラメーターを使用
    p current_user.present?
    @user  = current_user
    Book.create!(body: params[:content],
                        user_id: @user.id)
    raise flash[:danger] = 1

    flash[:notice] = "Book was successfully created."

    redirect_to book
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
        flash[:notice] = "Book was successfully updated."
      else#これないとミスる
        flash[:danger] = 'mistake'
      end
    redirect_to book
  end

  def destroy
  	@book = Book.find(params[:id])#データ(レコード)を1件取得
    @book.destroy#レコードをDBから削除
    redirect_to books_path#post一覧画面へリダイレクト
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
