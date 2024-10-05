# frozen_string_literal: true

module Items
	class Create
		include Interactor

		delegate :menu, :item_params, to: :context

		def call
			item = menu.items.build(item_params)

			if item.save
				context.item = item
			else
				context.fail!(error: item.errors.full_messages.to_sentence)
			end
		end
	end
end