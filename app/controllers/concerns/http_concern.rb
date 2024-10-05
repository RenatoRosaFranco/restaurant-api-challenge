# frozen_string_literal: true

module HttpConcern
	include ActiveSupport::Concern

	private

	def handle_response(data, serializer, status: :ok)
		render json: serialize_obj(serializer, data), status: status
	end

	def handle_error(errors, status: :unprocessable_entity)
		render json: { error: errors }, status: status
	end

	private

	def serialize_obj(serializer, data)
		serializer.new(data).send(:serializable_hash)
	end
end
