require './lib/book'
class Author

  attr_reader :name, :books
  def initialize(info)
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end

  def write(title, date)
    name_split = @name.split(" ")
    info = {author_first_name: name_split[0],
            author_last_name: name_split[1],
            title: title,
            publication_date: date
          }
    book = Book.new(info)
    @books << book
    book
  end
  
end
