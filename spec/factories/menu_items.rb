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
FactoryBot.define do
  factory :menu_item do
    name { 'Pizza' }
    description { 'Cheesy pizza' }
    price { 9.99 }
    availability { true }
    association :menu

    trait :invalid do
      name { '' }
      price { nil }
    end
  end
end
