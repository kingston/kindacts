class ActSerializer < ActiveModel::Serializer
  attributes :id, :description, :lat, :lng, :mission
end
