# frozen_string_literal: true

class Bike < ApplicationRecord
  has_one_attached :image
  belongs_to :style
  has_many :bike_visitings
  before_create :update_price

  scope :by_name, ->(name_filter) { where('lower(name) LIKE ?', "%#{name_filter.downcase}%") }
  scope :by_price_larger_than, ->(price_larger_than_filter) { where('price > ?', price_larger_than_filter) }
  scope :by_price_lower_than, ->(price_lower_than_filter) { where('price < ?', price_lower_than_filter) }
  scope :by_style, ->(style_filter) { where(style_id: style_filter) }
  scope :order_by_visitings, lambda {
                               Bike.left_outer_joins(:bike_visitings).group('bikes.id').order('count(bikes.id) DESC')
                             }

  def update_price
    self.price = PriceGeneratorService.new(name, price).generate_price
  end

  def new_visit
    BikeVisiting.create(bike: self)
  end
end
