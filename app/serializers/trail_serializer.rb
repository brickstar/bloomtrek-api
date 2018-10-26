class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :uid, :difficulty, :length, :status, :trail_img_url, :trail_url, :summary, :latitude, :longitude, :park_id

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
end
