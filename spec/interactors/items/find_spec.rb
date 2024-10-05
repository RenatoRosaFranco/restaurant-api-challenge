# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Items::Find do
  subject { described_class.call(item_id: item.id) }

  let(:menu) { create(:menu) }
  let(:item) { create(:menu_item, menu:) }

  describe '.call' do
    context 'when item exists' do
      it 'returns the item', :aggregate_failures do
        expect(subject).to be_success
        expect(subject.item).to eq(item)
      end
    end

    context 'when item does not exist' do
      let(:item) { build(:menu_item, id: -1, menu:) }

      it 'fails with an error', :aggregate_failures do
        expect(subject).to be_failure
        expect(subject.error).to eq('Item not found')
      end
    end
  end
end
