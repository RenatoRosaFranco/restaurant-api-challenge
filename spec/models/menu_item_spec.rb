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
require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  subject { build(:menu_item) }

  describe 'associations' do
    it { is_expected.to belong_to(:menu) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

    it 'validates inclusion of availability in [true, false]' do
      is_expected.to allow_value(true).for(:availability)
      is_expected.to allow_value(false).for(:availability)
    end
  end
end
