require 'spec_helper'

feature "user creates " do

  it "user successfully creates a new book" do

    visit new_book_path

    expect(page).to have_content "Add your book to the shelf"

    book = FactoryGirl.build(:book)
    fill_in "Title", with: book.title
    fill_in "Author", with: book.author
    fill_in "Year", with: book.year
    fill_in "Description", with: book.description
    fill_in "Category", with: book.category

    click_on "Save book"

    expect(page).to have_content "Your book has been saved!"
  end

  it "does not create a new book when required input is not provided" do

    visit new_book_path

    expect(page).to have_content "Add your book to the shelf"

    book = FactoryGirl.build(:book)
    fill_in "Title", with:""
    fill_in "Author", with:""
    fill_in "Year", with: book.year
    fill_in "Description", with: book.description
    fill_in "Category", with: book.category

    click_on "Save book"

    expect(page).to have_content "Some of the fields were invalid"
  end

  it "user attempts to send an empty form" do

    visit new_book_path

    expect(page).to have_content "Add your book to the shelf"
    click_on "Save book"
    expect(page).to have_content "Some of the fields were invalid"
  end

end
