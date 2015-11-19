class Mood < ActiveRecord::Base
  has_many :foods, dependent: :destroy
  belongs_to :user
end
