require './lib/library'
require './lib/author'

RSpec.describe Library do
  context "Initialize" do
    it 'exists' do
      dpl = Library.new("Denver Public Library")
      expect(dpl).to be_a(Library)
    end

    it 'has a name' do
      dpl = Library.new("Denver Public Library")
      expect(dpl.name).to eq("Denver Public Library")
    end

    it 'starts with no books' do
      dpl = Library.new("Denver Public Library")
      expect(dpl.books).to eq([])
    end

    it 'starts with no authors' do
      dpl = Library.new("Denver Public Library")
      expect(dpl.authors).to eq([])
    end

    it 'starts with no checked out books' do
      dpl = Library.new("Denver Public Library")
      expect(dpl.checked_out_books).to eq([])
    end
  end

  context "Iteration 3 Methods" do
    it 'can add authors' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    end

    it 'adds authors books when adding an author' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end

    it 'can list all publication years for an author' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.list_pub_years(charlotte_bronte)).to eq(["1847", "1857", "1853"])
      expect(dpl.list_pub_years(harper_lee)).to eq(["1960"])
    end

    it 'can calculate publication time frame' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  context "Iteration 4 Methods" do
    it 'can checkout books' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      expect(dpl.checkout(mockingbird)).to be false

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.checkout(mockingbird)).to be true
    end

    it 'can checkout books' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      expect(dpl.checkout(mockingbird)).to be false

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.checkout(mockingbird)).to be true
    end

    it 'can add checkout books to list and remove from shelf' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      dpl.checkout(mockingbird)
      expect(dpl.checked_out_books).to eq([mockingbird])
      expect(dpl.books).to eq([jane_eyre, professor, villette])
    end

    it 'can add 1 to the checkout count of a book' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      dpl.checkout(mockingbird)
      expect(mockingbird.check_out_count).to eq(1)
    end

    it 'can return a book' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      dpl.checkout(mockingbird)
      dpl.return(mockingbird)
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
      expect(dpl.checked_out_books).to eq([])
      expect(mockingbird.check_out_count).to eq(1)
    end

    it 'can find the most popular book' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      dpl.checkout(jane_eyre)
      dpl.return(jane_eyre)
      dpl.checkout(jane_eyre)
      dpl.checkout(villette)
      dpl.checkout(mockingbird)
      dpl.return(mockingbird)
      dpl.checkout(mockingbird)
      dpl.return(mockingbird)
      dpl.checkout(mockingbird)

      expect(dpl.most_popular_book).to eq(mockingbird)
    end
  end
end
