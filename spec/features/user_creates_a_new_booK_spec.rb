require 'spec_helper'

feature "user creates " do

  it "user successfully creates a new book" do

    visit new_book_path

    book = FactoryGirl.build(:book)
    fill_in "title", with: book.title
    fill_in "author", with: book.author
    fill_in "year", with: book.year
    fill_in "description", with: book.description

    click_on "Create book"

    expect(page).to have_content "Your book has been saved!"
    expect(page).to have_content "List of all books"
  end

  # it "authorized user submits invalid post and is denied" do
  #   user = FactoryGirl.create(:user)
  #   sign_in_as(user)

  #   visit new_beard_path

  #   click_on "Create Beard"

  #   expect(page).to_not have_content "Success"
  #   expect(page).to have_content "Your beard could not be saved!"
  # end

  # it "unauthorized user tries to visit posts page" do
  #   visit new_beard_path

  #   expect(page).to_not have_content "Description"
  #   expect(page).to have_content "You need to sign in or sign up before continuing"
  # end


end
