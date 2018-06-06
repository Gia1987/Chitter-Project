require 'pg'

task :test_database_setup do
# 'Cleaning database...'
# connect to the database
connection = PG.connect(dbname: 'chitter_test')

# clear the test data
connection.exec('TRUNCATE peeps;')

# Insert test data
connection.exec("INSERT INTO peeps VALUES('Ciao Sono Giacomo');")
connection.exec("INSERT INTO peeps VALUES('Ciao Sono Alessio');")
connection.exec("INSERT INTO peeps VALUES('Hola todos');")
end

task :setup do
  # "Creating databases..."
  connection = PG.connect
  connection.exec('CREATE DATABASE chitter;')
  connection.exec('CREATE DATABASE chitter_test;')

  connection = PG.connect(dbname: 'chitter')
  connection.exec('CREATE TABLE peeps(message VARCHAR(500), time VARCHAR(20));')

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('CREATE TABLE peeps(message VARCHAR(500), time VARCHAR(20));')
end
