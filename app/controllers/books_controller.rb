class BooksController < ApplicationController
  before_action :authenticate_user!
 	def new
    	@book = Book.new
	end

	def index
		@books = Book.all
    @book = Book.new
    @user = current_user
	end

	def show
		@book_show = Book.find_by(id: params[:id])
    @user = @book_show.user #idにuserが紐づいていない？
		#@user = current_user一旦変える
    @books = @user.books
    @book = Book.new
		#@user = @book.user # 投稿に紐付くユーザ情報を取得する(Postモデルで定義した関数)
	end

  def create# ストロングパラメーターを使用
    @user  = current_user
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = @user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books
    else
      flash[:notice] = "error!"#この行いらない
      render :index #actionにとどまったままviewを呼び出す
    end

  end

  def edit
    @edit_book = Book.find_by(id: params[:id])
    @user = current_user
    @book = Book.new
  end

  def update
    @edit_book = Book.find_by(id: params[:id])
    @user = current_user
    book = Book.find_by(id:params[:id])
    if @edit_book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book
      else#これないとミスる
        flash[:danger] = 'error!'
        puts book.errors.full_messages
        render :edit
      end
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
