# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :request do
	include_context 'json_response'

	let!(:menu) { create(:menu) }
	let!(:items) { create_list(:menu_item, 3, menu:) }
	let(:menu_id) { menu.id }
	let(:item_id) { items.first.id }

	let(:attributes) { attributes_for(:menu_item, menu_id: menu_id) }
	
	describe 'POST /api/v1/menus/:menu_id/items' do
		context 'with valid parameters' do
			before do
				post "/api/v1/menus/#{menu_id}/items",
				params: { item: attributes }
			end

			it 'creates a new Item', :aggregate_failures do
				expect(response).to have_http_status(:created)
				expect(json_response[:data][:attributes][:name]).to eq(attributes[:name])
			end
		end

		context 'with invalid parameters' do
			let(:attributes) { attributes_for(:menu_item, :invalid).merge(menu_id: menu_id) }

			subject(:request) do
				post "/api/v1/menus/#{menu_id}/items",
				params: { item: attributes }
			end

			it 'does not create a new Item', :aggregate_failures do
				expect { request }.not_to change(MenuItem, :count)
				expect(response).to have_http_status(:unprocessable_entity)
			end
		end
	end

	describe 'PUT /api/v1/menus/:menu_id/items/:id' do
		context 'with valid parameters' do
			before do
				put "/api/v1/menus/#{menu_id}/items/#{item_id}",
				params: { item: attributes }
			end

			it 'updates the item', :aggregate_failures do
				expect(response).to have_http_status(:ok)
				expect(json_response[:data][:attributes][:name]).to eq(attributes[:name])
			end
		end

		context 'with invalid parameters' do
			let(:attributes) { attributes_for(:menu_item, :invalid).merge(menu_id: menu_id) }

			before do
				put "/api/v1/menus/#{menu_id}/items/#{item_id}", 
				params: { item: attributes }
			end

			it 'does not update the item' do
				expect(response).to have_http_status(:unprocessable_entity)
			end
		end
	end

	describe 'DELETE /api/v1/menus/:menu_id/items/:id' do
		subject(:request) { delete "/api/v1/menus/#{menu_id}/items/#{item_id}" }

		it 'removes the item', :aggregate_failures do
			expect { request }.to change(MenuItem, :count).by(-1)
			expect(response).to have_http_status(:no_content)
		end
	end
end