class Book

  attr_reader :title, :author, :publication_year, :check_out_count
  def initialize(info)
    @title = info[:title]
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @publication_year = info[:publication_date][-4..-1]
    @check_out_count = 0
  end

  def checkout
    @check_out_count += 1
  end
end
