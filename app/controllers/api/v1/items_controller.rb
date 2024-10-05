# frozen_string_literal: true

module Api
	module V1
		class ItemsController < ApplicationController
			before_action :set_item, only: %i[update destroy]
			
			# POST /api/v1/menus/:menu_id/items
			# Creates a new item associated with a specific menu.
			def create
				result = Items::Create.call(menu: find_menu, item_params: item_params)

				if result.success?
					handle_response(result.item, MenuItemSerializer, status: :created)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			# PUT /api/v1/menus/:menu_id/items/:id
			# Updates an existingitem.
			def update
				result = Items::Update.call(item: @item, item_params: item_params)

				if result.success?
					handle_response(result.item, MenuItemSerializer, status: :ok)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			# DELETE /api/v1/menus/:menu_id/items/:id
			# Removes an existing item.
			def destroy
				result = Items::Destroy.call(item: @item)

				if result.success?
					handle_response(nil, MenuItemSerializer, status: :no_content)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			private

			def set_item
				result = Items::Find.call(item_id: params[:id])

				if result.success?
					@item = result.item
				else
					handle_error(result.error, status: :not_found)
				end
			end

			def find_menu
				@menu ||= Menu.find(params[:menu_id])
			end

			def item_params
				params.require(:item).permit(item_attributes)
			end
			
			def item_attributes
				%w[name description price availability]
			end
		end
	end
end
