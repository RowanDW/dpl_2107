class Library

  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books = (@books << author.books).flatten
  end

  def publication_time_frame_for(author)
    years = list_pub_years(author)
    time_frame = {:start => years.min, :end => years.max}
  end

  def list_pub_years(author)
    author.books.map do |book|
      book.publication_year
    end
  end

  def checkout(book)
    if @books.include?(book)
      book.checkout
      @checked_out_books << @books.delete(book)
      true
    else
      false
    end
  end

  def return(book)
    @books << book
    @checked_out_books.delete(book)
  end

  def most_popular_book
    all_books = @books.concat(@checked_out_books)
    all_books.max_by do |book|
      book.check_out_count
    end
  end
end
