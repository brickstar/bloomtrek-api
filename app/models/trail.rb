class Trail < ApplicationRecord
  validates_presence_of :difficulty,
                        :length,
                        :status,
                        :trail_img_url,
                        :trail_url

  belongs_to :park
  has_many :flowers, through: :park
end
