# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menus::Find, type: :interactor do
  subject { described_class.call(menu_id: menu_id) }

  let!(:menu) { create(:menu) }
  let(:menu_id) { menu.id }

  context 'when the menu exists' do
    it 'finds the menu', :aggregate_failures do
      expect(subject).to be_success
      expect(subject.menu).to eq(menu)
    end
  end

  context 'when the menu does not exist' do
    let(:menu_id) { menu.id - 1 }

    it 'fails to find the menu', :aggregate_failures do
      expect(subject).to be_failure
      expect(subject.error).to eq('Menu not found')
    end
  end
end
