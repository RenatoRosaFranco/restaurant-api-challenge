# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Items::Update do
  subject { described_class.call(item:, item_params: attributes) }

  let(:menu) { create(:menu) }
  let(:item) { create(:menu_item, menu:) }

  describe '.call' do
    context 'when item is successfully updated' do
      let(:attributes) { attributes_for(:menu_item, { name: 'Sushi', price: 15.99 }) }

      it 'updates the item and returns the updated item', :aggregate_failures do
        expect(subject).to be_success
        expect(subject.item.name).to eq('Sushi')
        expect(subject.item.price).to eq(15.99)
      end
    end

    context 'when item update fails' do
      let(:attributes) { attributes_for(:menu_item, { name: '', price: -10.00 }) }

      it 'fails with an error', :aggregate_failures do
        expect(subject).to be_failure
        expect(subject.error).to include("Name can't be blank and Price must be greater than or equal to 0")
      end
    end
  end
end
