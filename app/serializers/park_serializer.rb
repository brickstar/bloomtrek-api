class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :coords

  def coords
    {
      latitude: object.latitude,
      longitude: object.longitude
    }
  end
end
