class Page < ActiveRecord::Base
  validates :text, presence: true
end
