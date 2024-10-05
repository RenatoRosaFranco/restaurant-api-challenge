# frozen_string_literal: true

module Api
	module V1
		class MenusController < ApplicationController
			before_action :set_menu, only: %i[show update destroy]

			# GET /api/v1/menus
			# Returns a list of all menus.
			def index
				menus = Menu.all
				handle_response(menus, MenuSerializer, status: :ok)
			end

			# GET /api/v1/menus/:id
			# Returns the details of a specific menu.
			def show
				handle_response(@menu, MenuSerializer, status: :ok)
			end

			# POST /api/v1/menus
			# Creates a new menu.
			def create
				result = Menus::Create.call(menu_params: menu_params)

				if result.success?
					handle_response(result.menu, MenuSerializer, status: :created)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			# PUT /api/v1/menus/:id
			# Updates an existing menu.
			def update
				result = Menus::Update.call(menu: @menu, menu_params: menu_params)

				if result.success?
					handle_response(result.menu, MenuSerializer, status: :ok)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			# DELETE /api/v1/menus/:id
			# Removes an existing menu.
			def destroy
				result = Menus::Destroy.call(menu: @menu)

				if result.success?
					handle_response(nil, MenuSerializer, status: :no_content)
				else
					handle_error(result.error, status: :unprocessable_entity)
				end
			end

			private

			def set_menu
				result = Menus::Find.call(menu_id: params[:id])

				if result.success?
					@menu = result.menu
				else
					handle_error(result.error, status: :not_found)
				end
			end

			def menu_params
				params.require(:menu).permit(*menu_attributes)
			end

			def menu_attributes
				%w[name description]
			end
		end
	end
end