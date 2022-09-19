class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true

  validates :rate, length: { maximum: 255, minimum: 0, message: I18n.t('.out_of_range_error') }, presence: true
  validates :comment, length: { maximum: 65_535, minimum: 0, message: I18n.t('.out_of_range_error') }
end
