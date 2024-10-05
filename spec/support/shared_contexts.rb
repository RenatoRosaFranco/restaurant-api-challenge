# frozen_string_literal: true

RSpec.shared_context 'json_response' do
	def json_response
		JSON.parse(response.body, symbolize_names: true)
	end
end
