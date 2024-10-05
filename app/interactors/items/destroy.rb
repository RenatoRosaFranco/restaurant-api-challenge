# frozen_string_literal: true

module Items
	class Destroy
		include Interactor

		delegate :item, to: :context

		def call
			if item.destroy
				context.menu = nil
			else
				context.fail!(error: item.errors.full_messages.to_sentence)
			end
		end
	end
end