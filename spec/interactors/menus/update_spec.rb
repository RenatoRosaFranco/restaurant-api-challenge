# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menus::Update, type: :interactor do
  subject { described_class.call(menu:, menu_params:) }

  let!(:menu) do
    create(:menu, attributes_for(:menu))
  end

  context 'when the menu exists' do
    let(:menu_params) do
      attributes_for(:menu, { name: 'Brunch Menu', description: 'Breakfast and lunch options'})
    end

    it 'updates the menu', :aggregate_failures do
      expect(subject).to be_success
      expect(subject.menu.name).to eq('Brunch Menu')
    end
  end

  context 'when the parameters are invalid' do
    let(:menu_params) do
      attributes_for(:menu, name: '', description: 'Invalid menu name')
    end

    it 'fails to update the menu', :aggregate_failures do
      expect(subject).to be_failure
      expect(subject.error).to include("Name can't be blank")
    end
  end
end
