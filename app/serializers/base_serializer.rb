# frozen_string_literal: true

class BaseSerializer
	def created_at
		format_date(:created_at)
	end

	def updated_at
		format_date(:updated_at)
	end

	private

	def format_date(field)
		object.send(field)&.strftime('%Y-%m-%d %H:%M:%S')
	end
end