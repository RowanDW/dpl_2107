require './lib/book'

RSpec.describe Book do
  context "Initialize" do
    it 'exists' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book).to be_a(Book)
    end

    it 'has a title' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.title).to eq("To Kill a Mockingbird")
    end

    it 'has an author' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.author).to eq("Harper Lee")
    end

    it 'has a publication year' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.publication_year).to eq("1960")
    end

    it 'starts with no checkouts' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      expect(book.check_out_count).to eq(0)
    end
  end

  context "Methods" do
    it 'can be checked out' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      book.checkout
      book.checkout
      book.checkout
      book.checkout
      expect(book.check_out_count).to eq(4)
    end
  end
end
