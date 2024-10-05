# frozen_string_literal: true

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
class MenuItem < ApplicationRecord
  # Associations
  belongs_to :menu

  # Validations
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end
