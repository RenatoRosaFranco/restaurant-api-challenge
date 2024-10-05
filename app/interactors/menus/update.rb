# frozen_string_literal: true

module Menus
	class Update
		include Interactor

		delegate :menu, :menu_params, to: :context

		def call
			if menu.update(menu_params)
				context.menu = menu
			else
				context.fail!(error: menu.errors.full_messages.to_sentence)
			end
		end
	end
end