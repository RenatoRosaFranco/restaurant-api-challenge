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
class Menu < ApplicationRecord
	# Associations
	has_many :items, class_name: 'MenuItem', dependent: :destroy

	# Validations
	validates :name, presence: true
	validates :description, presence: true
end
