require "link"

describe Link do

  describe '#.all' do
    it "returns all links, wrapped in link instances" do
      links = Link.all

      urls = links.map(&:url)
      # The above is the same as:
      ### urls = links.map { |link| link.url }

      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe '#.add' do
    it 'creates a new link' do
      Link.add(url: 'http://www.instagram.com')

      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include 'http://www.instagram.com'
    end

    it 'does not create link if url is incorrect' do
      Link.add(url: "incorrect url")

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include "incorrect url"
    end
  end
end
