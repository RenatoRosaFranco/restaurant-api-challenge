# frozen_string_literal: true

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
FactoryBot.define do
  factory :menu do
    name { "Dinner Menu" }
    description { "Delicious dinner options" }

    trait :invalid do
      name { '' }
      description { 'Invalid menu' }
    end
  end
end
