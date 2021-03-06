class Gadget < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :user, presence: true
end
