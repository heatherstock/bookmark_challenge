require_relative 'database_connection'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')

    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(new_link)
    return nil unless url?(new_link[:url])
    result = DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{new_link[:url]}', '#{new_link[:title]}') RETURNING id")
    result[0]['id']
  end

  def self.delete(old_link)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{old_link}")
  end

  private

  def self.url?(url)
    url =~ /^http:\/\/www\..+\..+/
  end
end
