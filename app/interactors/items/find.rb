# frozen_string_literal: true

module Items
	class Find
		include Interactor

		delegate :item_id, to: :context

		def call
			item = MenuItem.find_by(id: item_id)

			if item
				context.item = item
			else
				context.fail!(error: 'Item not found')
			end
		end
	end
end
