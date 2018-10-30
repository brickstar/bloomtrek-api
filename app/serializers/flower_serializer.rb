class FlowerSerializer < ActiveModel::Serializer
  attributes :id, :flower_img_url, :name, :common_name, :scientific_name, :description, :bloom_start, :bloom_end, :habitat

  def name
    object.name.titleize
  end

  def common_name
    object.common_name.titleize
  end

  def description
    object.description.capitalize
  end

  def habitat
    object.habitat.capitalize
  end

  def scientific_name
    object.scientific_name.titleize
  end
end
