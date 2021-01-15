class Album < ApplicationRecord #remember Models store our Business Logic
  #Active Record requires our class names to be singular, upper-camel-case form of our table names.
  has_many :songs, dependent: :destroy # Note that this new relationship will automatically create several new methods, including Album#songs and Song.album.
end