require 'pg'

task :test_database_setup do
# p 'Cleaning database...'
# connect to the database
connection = PG.connect(dbname: 'chitter_test')

# clear the test data
connection.exec('TRUNCATE peeps;')

# Insert test data
connection.exec("INSERT INTO peeps(message, time) VALUES('Ciao Sono Giacomo','2018-06-11 10:05:20');")
connection.exec("INSERT INTO peeps(message, time) VALUES('Ciao Sono Alessio','2017-08-03 10:05:20');")
connection.exec("INSERT INTO peeps(message, time) VALUES('Hola todos','2017-06-01 10:05:20');")
end

task :setup do
  # p "Creating databases..."
  connection = PG.connect
  connection.exec('CREATE DATABASE chitter;')
  connection.exec('CREATE DATABASE chitter_test;')

  connection = PG.connect(dbname: 'chitter')
  connection.exec('CREATE TABLE peeps(message VARCHAR(500), time TIMESTAMP);')

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('CREATE TABLE peeps(message VARCHAR(500), time TIMESTAMP);')
end
