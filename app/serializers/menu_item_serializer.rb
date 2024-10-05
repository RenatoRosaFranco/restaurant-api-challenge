# == Schema Information
#
# Table name: menu_items
#
#  id           :integer          not null, primary key
#  availability :boolean
#  description  :text
#  name         :string
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  menu_id      :integer          not null
#
# Indexes
#
#  index_menu_items_on_menu_id  (menu_id)
#
# Foreign Keys
#
#  menu_id  (menu_id => menus.id)
#
class MenuItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description, :price, :availability,
             :created_at, :updated_at

  belongs_to :menu
end
