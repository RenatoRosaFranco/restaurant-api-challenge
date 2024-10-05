# frozen_string_literal: true

module Menus
	class Find
		include Interactor

		delegate :menu_id, to: :context

		def call
			menu = Menu.find_by(id: menu_id)

			if menu
				context.menu = menu
			else
				context.fail!(error: 'Menu not found')
			end
		end
	end
end