class Report < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  include Commentable
end
