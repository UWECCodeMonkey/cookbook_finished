class Person
  attr_accessor :name, :username
  def initialize(name, username)
    self.name = name
    self.username = username
  end
end

people = [
  Person.new("Veronica Palmer", "vpalmer"),
  Person.new("Ted Crisp", "tcrisp"),
  Person.new("Linda Zwording", "lzwording"),
  Person.new("Phil Myman", "pmyman")
]

usernames = people.collect{|person| person.username + "@veridiandynamics.com"}

message = usernames.join(";")

puts message
