class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    if @review.save
      redirect_to "/books/#{@book.id}"
    else
      flash[:notice]= "Please provide the required input"
      render :new
    end
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
