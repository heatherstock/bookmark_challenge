require_relative 'database_connection'

class Link
  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")

    result.map { |link| Link.new(link['id'], link['url']) }
  end

  def self.add(new_link)
    return false unless is_url?(new_link[:url])
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{new_link[:url]}')")
  end

  private

  def self.is_url?(url)
    url =~ /^http:\/\/www\..+\..+/
  end
end
