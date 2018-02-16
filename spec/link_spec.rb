require 'link'

describe Link do

  describe '.all' do
    it 'returns all titles, wrapped in link instances' do
      Link.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      links = Link.all
      titles = links.map(&:title)
      # The above is the same as:
      ### titles = links.map { |link| link.title }

      expect(titles).to include('Makers Academy')
    end
  end

  describe '.add' do
    it 'creates a new link' do
      id = Link.add(url: 'http://www.instagram.com', title: 'Instagram')
      expect(id).not_to be_nil
    end

    it 'does not create link if url is incorrect' do
      id = Link.add(url: 'incorrect url')
      expect(id).to be_nil
    end
  end

  describe '.delete' do
    it 'deletes a link' do
      id = Link.add(url: 'http://www.instagram.com', title: 'Instagram')
      Link.delete(id)

      links = Link.all
      titles = links.map(&:title)

      expect(titles).not_to include 'Instagram'
    end
  end
end
