# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Items::Create do
  subject { described_class.call(menu:, item_params: attributes) }

  let(:menu) { create(:menu) }

  describe '.call' do
    context 'with valid attributes' do
      let(:attributes) { attributes_for(:menu_item) }

      it 'creates a new item', :aggregate_failures do
        expect(subject.success?).to be_truthy
        expect(subject.item).to be_a(MenuItem)
        expect(subject.item.name).to eq('Pizza')
        expect(subject.item).to be_persisted
      end
    end

    context 'with invalid attributes', :aggregate_failures do
      let(:attributes) { attributes_for(:menu_item, :invalid) }

      it 'fails to create a new item', :aggregate_failures do
        expect(subject.success?).to be_falsey
        expect(subject.error).to include('Name can\'t be blank', 'Price can\'t be blank', 'Price is not a number')
      end
    end
  end
end
