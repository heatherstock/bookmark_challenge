require "link"

describe Link do

  describe '.all' do
    it "returns all titles, wrapped in link instances" do
      links = Link.all

      titles = links.map(&:title)
      # The above is the same as:
      ### titles = links.map { |link| link.title }

      expect(titles).to include("Makers Academy")
      expect(titles).to include("Google")
      expect(titles).to include("Facebook")
    end
  end

  describe '.add' do
    it 'creates a new link' do
      Link.add(url: 'http://www.instagram.com', title: 'Instagram')

      links = Link.all
      titles = links.map(&:title)

      expect(titles).to include 'Instagram'
    end

    it 'does not create link if url is incorrect' do
      Link.add(url: "incorrect url")

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include "incorrect url"
    end
  end
end
