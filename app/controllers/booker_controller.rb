class BookerController < ApplicationController
  def home
  	@user = current_user
  end
end
