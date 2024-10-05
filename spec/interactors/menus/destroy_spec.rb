# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menus::Destroy, type: :interactor do
  subject { described_class.call(menu:) }

  let!(:menu) { create(:menu) }

  context 'when the menu exists' do
    it 'destroys the menu', :aggregate_failures do
      expect(subject).to be_success
      expect { menu.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
