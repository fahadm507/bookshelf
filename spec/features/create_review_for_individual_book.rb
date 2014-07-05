require 'spec_helper'

feature 'creates review for an individual book' do

  it 'shows the description and rating' do

    book = FactoryGirl.create(:book)

    visit book_path(book.id)

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.year)

  end
end
