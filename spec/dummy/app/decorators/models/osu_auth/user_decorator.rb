# Example of how to decorate the User model which adds a new method
OsuAuth::User.class_eval do
  attr_accessor :example

  def hello_world
    'Hello World'
  end

  def self.greetings
    'Greetings!'
  end

end
