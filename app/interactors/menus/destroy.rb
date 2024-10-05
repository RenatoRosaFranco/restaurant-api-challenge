# frozen_string_literal: true

module Menus
	class Destroy
		include Interactor

		delegate :menu, to: :context

		def call
			if menu.destroy
				context.menu = nil
			else
				context.fail!(error: menu.errors.full_messages.to_sentence)
			end
		end
	end
end