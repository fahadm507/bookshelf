require 'spec_helper'

feature 'user reviews individual book' do

  it 'it shows a from where the user enter review body and rating' do

    book = FactoryGirl.create(:book)
    reviews = FactoryGirl.create_list(:review, 10)

   visit new_book_review_path(book.id)
    fill_in 'Rating', with: 2
    fill_in 'Body', with: 'I like this book'

    click_on "Submit"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.year)

    book.reviews.each do |review|
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)
    end
  end

  it 'does not create a new review if user enters invalid data' do

    book = FactoryGirl.create(:book)
    reviews = FactoryGirl.create_list(:review, 10)

   visit new_book_review_path(book.id)
    fill_in 'Rating', with: 8
    fill_in 'Body', with: ''

    click_on "Submit"

    expect(page).to have_content "Please provide the required input"
  end
end
