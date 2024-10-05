# == Schema Information
#
# Table name: menus
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MenuSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description,
             :created_at, :updated_at

  has_many :items
end
