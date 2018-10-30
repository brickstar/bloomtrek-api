class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :uid, :difficulty, :length, :status, :trail_img_url, :trail_url, :summary, :park_id, :coords

  def difficulty
    difficulty = object.difficulty.downcase
    if difficulty == "green" || difficulty == "greenblue"
      return "easy"
    elsif difficulty == "blue" || difficulty == "blueblack"
      return "medium"
    elsif difficulty == "black" || difficulty == "blackblack"
      return "hard"
    end
  end

  def coords
    {
      latitude: object.latitude,
      longitude: object.longitude
    }
  end
end
