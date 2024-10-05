# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MenusController, type: :request do
  include_context 'json_response'

  let!(:menus) { create_list(:menu, 3) }
  let(:menu_id) { menus.first.id }

  let(:attributes) { attributes_for(:menu) }

  describe 'GET /api/v1/menus' do
    before { get '/api/v1/menus' }

    it 'returns all menus', :aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(json_response[:data].size).to eq(3)
    end
  end

  describe 'GET /api/v1/menus/:id' do
    before { get "/api/v1/menus/#{menu_id}" }

    context 'when the menu exists' do
      it 'returns the menu', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(json_response[:data][:attributes][:name]).to eq(menus.first.name)
      end
    end

    context 'when the menu does not exist' do
      let(:menu_id) { 999 }

      it 'returns a not found status', :aggregate_failures do
        expect(response).to have_http_status(:not_found)
        expect(json_response[:error]).to eq('Menu not found')
      end
    end
  end

  describe 'POST /api/v1/menus' do
    context 'with valid parameters' do
      before { post '/api/v1/menus', params: { menu: attributes } }

      it 'creates a new menu', :aggregate_failures do
        expect(response).to have_http_status(:created)
        expect(json_response[:data][:attributes][:name]).to eq('Dinner Menu')
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { attributes_for(:menu, :invalid) }

      before { post '/api/v1/menus', params: { menu: attributes } }

      it 'returns unprocessable entity', :aggregate_failures do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response[:error]).to include("Name can't be blank")
      end
    end
  end

  describe 'PUT /api/v1/menus/:id' do
    context 'when the menu exists' do
      context 'with valid parameters' do
        before do
          put "/api/v1/menus/#{menu_id}", params: { menu: { name: 'Fazzano Menu' } }
        end

        it 'updates the menu', :aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(json_response[:data][:attributes][:name]).to eq('Fazzano Menu')
        end
      end

      context 'with invalid parameters' do
        before { put "/api/v1/menus/#{menu_id}", params: { menu: { name: '' } }}

        it 'returns unprocessable entity', :aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)
          expect(json_response[:error]).to include("Name can't be blank")
        end
      end
    end

    context 'when the menu does not exist' do
      let(:menu_id) { 999 }

      before { put '/api/v1/menus/99999', params: attributes }

      it 'returns a not found status', :aggregate_failures do
        expect(response).to have_http_status(:not_found)
        expect(json_response[:error]).to eq('Menu not found')
      end
    end
  end

  describe 'DELETE /api/v1/menus/:id' do
    before { delete "/api/v1/menus/#{menu_id}" }

    context 'when the menu exists' do
      it 'deletes the menu' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the menu does not exist' do
      let(:menu_id) { 999 }

      it 'returns a not found status', :aggregate_failures do
        expect(response).to have_http_status(:not_found)
        expect(json_response[:error]).to eq('Menu not found')
      end
    end
  end
end