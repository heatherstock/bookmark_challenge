require 'pg'

task :setup do
  p 'creating databases with preloaded tables'
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
    p "created #{database}"
  end
end

task :setup_test_database do
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec('TRUNCATE TABLE links;')

  # connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  # connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  # connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
end

task :remove_database do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
    p "Deleted #{database}"
  end
end
