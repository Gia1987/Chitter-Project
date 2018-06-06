require 'pg'
require 'uri'
require_relative './database_connection'
# Peep class manage peeps
class Peep
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peep| peep['message'] } # list of messages
  end

  def self.add(message)
    DatabaseConnection.query("INSERT INTO peeps(message) VALUES('#{message}')") # Allows to add new message to the database
  end
end
