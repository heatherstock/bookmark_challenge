require_relative 'database_connection'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")

    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(new_link)
    return false unless is_url?(new_link[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{new_link[:url]}', '#{new_link[:title]}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  def self.find(id)
    DatabaseConnection.query("SELECT * FROM links WHERE id = #{id}").first
  end

  # def self.update(id, title, url)
  #   DatabaseConnection.query("UPDATE links SET (title, url) = (#{title}, #{url}) WHERE id = #{id}")
  # end

  def self.update(params)
    DatabaseConnection.query("UPDATE links SET (title, url) = ('#{params['title']}', '#{params['url']}') WHERE id = #{params['id']}")
  end

  private

  def self.is_url?(url)
    url =~ /^http:\/\/www\..+\..+/
  end
end









