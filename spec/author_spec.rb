require './lib/author'

RSpec.describe Author do
  context "Initialize" do
    it 'exists' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_a(Author)
    end

    it 'has a name' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'starts with no books' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.books).to eq([])
    end
  end

  context "Methods" do
    it 'can write a book' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre).to be_a(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
      expect(jane_eyre.author).to eq("Charlotte Bronte")
      expect(jane_eyre.publication_year).to eq("1847")
    end

    it 'adds a written book to books' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(charlotte_bronte.books[0]).to be_a(Book)
      expect(charlotte_bronte.books[0].title).to eq("Jane Eyre")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(charlotte_bronte.books.length).to eq(2)
      expect(charlotte_bronte.books[1].title).to eq("Villette")
    end
  end
end
