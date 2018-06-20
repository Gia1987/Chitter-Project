require 'pg'
require_relative './database_connection'
# Peep class manage peeps
class Peep
  attr_reader :message, :time, :id

  def initialize(id, message, time)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peep| Peep.new(peep['id'], peep['message'], peep['time']) }.reverse # list of messages
  end

  def self.add(message, time)
    #@date = Time.new.strftime("%F").split("-").reverse().join("/")
    DatabaseConnection.query("INSERT INTO peeps(message, time) VALUES('#{message}','#{time}');") # Allows to add new message to the database
  end
end
