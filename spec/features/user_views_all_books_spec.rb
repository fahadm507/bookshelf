require 'spec_helper'

feature 'user can view all the books on the shelf' do

  it 'shows all the books on the shelf' do
    books = FactoryGirl.create_list(:book, 10)

    visit books_path

      expect(page).to have_content "All books"

    books.each do |book|
      expect(page).to have_content(book.title)
    end
  end
end
