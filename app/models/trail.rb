class Trail < ApplicationRecord
  def self.from_api(data)
    where(uid: data[:id]).first_or_initialize.tap do |trail|
      next if data[:imgMedium].empty?
      next if data[:summary].empty?
      trail.name = data[:name]
      trail.uid = data[:id]
      trail.difficulty = data[:difficulty]
      trail.length = data[:length]
      trail.status = data[:conditionStatus]
      trail.trail_img_url = data[:imgMedium]
      trail.trail_url = data[:url]
      trail.summary = data[:summary]
      trail.latitude = data[:latitude]
      trail.longitude = data[:longitude]
      trail.save!
    end
  end

  validates_presence_of :difficulty,
                        :length,
                        :status,
                        :trail_img_url,
                        :trail_url,
                        :uid, uniqueness: true
                        :latitude,
                        :longitude,
                        :summary,
                        :name  

  belongs_to :park
  has_many :flowers, through: :park
end
