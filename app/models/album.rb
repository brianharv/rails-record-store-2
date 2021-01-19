class Album < ApplicationRecord #remember Models store our Business Logic
  #Active Record requires our class names to be singular, upper-camel-case form of our table names.
  has_many :songs, dependent: :destroy # Note that this new relationship will automatically create several new methods, including Album#songs and Song.album.
  validates :name, presence: true
  validates_length_of :name, maximum: 100

  before_save(:titleize_album) #We add a callback that states the method titleize_album will be called before_save. Callbacks are methods that get called at certain points of an object's life cycle, such as before it is saved or after it is deleted.

  private # this is private because we only want it called within the Album class.

  def titleize(user_input)
    input_array = []
    user_input = user_input.split(' ')
    user_input.each do |word|
      input_array.push((word.capitalize))
    end
    input_array.join(' ')  
  end  

  def titleize_a
    self.name = self.name.titleize
  end 
end