# Vendor serializer
# Used for serializing the Vendor object to JSON
class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name
end
