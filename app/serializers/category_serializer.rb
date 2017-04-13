# Category serializer
# Used for serializing the Category object to JSON
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end
