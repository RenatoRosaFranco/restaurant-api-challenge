# frozen_string_literal: true

module Items
	class Update
		include Interactor

		delegate :item, :item_params, to: :context

		def call
			if item.update(item_params)
				context.item = item
			else
				context.fail!(error: item.errors.full_messages.to_sentence)
			end
		end
	end
end
