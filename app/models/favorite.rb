class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :picture, optional: true
end
