class Trail < ApplicationRecord
  def self.from_api(data)
    where(uid: data.uid).first_or_initialize.tap do |trail|
      trail.name = data.name
      trail.uid = data.uid
      trail.difficulty = data.difficulty
      trail.length = data.length
      trail.status = data.status
      trail.trail_img_url = data.trail_img_url
      trail.trail_url = data.trail_url
      trail.summary = data.summary
      trail.latitude = data.latitude
      trail.longitude = data.longitude
      trail.save!
    end
  end

  validates_presence_of :difficulty,
                        :length,
                        :status,
                        :trail_img_url,
                        :trail_url,
                        :uid,
                        :latitude,
                        :longitude,
                        :summary,
                        :name

  belongs_to :park
  has_many :flowers, through: :park
end
