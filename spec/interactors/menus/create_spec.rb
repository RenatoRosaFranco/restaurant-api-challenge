# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menus::Create, type: :interactor do
  subject { described_class.call(menu_params:) }

  let(:attributes) { { name: 'Lunch Menu', description: 'Delicious lunch options' } }
  let(:menu_params) { attributes_for(:menu, attributes) }

  context 'when the parameters are valid' do
    it 'creates a new menu', :aggregate_failures do
      expect(subject).to be_success
      expect(subject.menu).to be_persisted
      expect(subject.menu.name).to eq('Lunch Menu')
    end
  end

  context 'when the parameters are invalid' do
    let(:attributes) { { name: '', description: 'No name menu' } }

    it 'fails to create a menu', :aggregate_failures do
      expect(subject).to be_failure
      expect(subject.error).to include("Name can't be blank")
    end
  end
end
