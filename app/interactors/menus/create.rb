# frozen_string_literal: true

module Menus
	class Create
		include Interactor

		delegate :menu_params, to: :context

		def call
			menu = Menu.new(menu_params)

			if menu.save
				context.menu = menu
			else
				context.fail!(error: menu.errors.full_messages.to_sentence)
			end
		end
	end
end