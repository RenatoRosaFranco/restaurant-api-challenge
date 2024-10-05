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
require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject { build(:menu) }

  describe 'associations' do
    it { is_expected.to have_many(:items).class_name('MenuItem').dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
