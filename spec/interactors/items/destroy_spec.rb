# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Items::Destroy do
  subject { described_class.call(item:) }

  let(:menu) { create(:menu) }
  let(:item) { create(:menu_item, menu:) }

  describe '.call' do
    context 'when the item exists' do
      it 'destroys the item', :aggregate_failures do
        expect(subject.success?).to be_truthy
        expect(subject.menu).to be_nil
        expect(MenuItem.exists?(item.id)).to be_falsey
      end
    end

    context 'when the item cannot be destroyed' do
      before do
        allow(item).to receive(:destroy).and_return(false)
        allow(item).to receive(:errors).and_return(double(full_messages: ['Cannot delete this item']))
      end

      it 'fails to destroy the item', :aggregate_failures do
        expect(subject.success?).to be_falsey
        expect(subject.error).to eq('Cannot delete this item')
      end
    end
  end
end
