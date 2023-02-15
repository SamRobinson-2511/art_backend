class ArtSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_display, :medium_display, :is_on_view
end
