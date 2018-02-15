require "link"

describe Link do

  describe '#.all' do
    it "returns all links" do
      links = Link.all
      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.google.com")
      expect(links).to include("http://www.facebook.com")
    end
  end

  describe '#.add' do
    it 'creates a new link' do
      Link.add(url: 'http://www.instagram.com')
      expect(Link.all).to include 'http://www.instagram.com'
    end

    it 'does not create link if url is incorrect' do
      Link.add(url: "incorrect url")
      expect(Link.all).not_to include "incorrect url"
    end
  end
end
