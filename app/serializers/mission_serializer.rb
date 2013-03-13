class MissionSerializer < ActiveModel::Serializer
  attributes :id, :description, :act_autofill, :icon, :color, :time, :order
end
