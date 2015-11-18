class Mood < ActiveRecord::Base
  has_many :foods
end
