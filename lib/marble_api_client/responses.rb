# frozen_string_literal: true

require_relative 'responses/http_methods'
require_relative 'responses/body_attributes'

require_relative 'responses/success'
require_relative 'responses/client_error'
require_relative 'responses/server_error'

require_relative 'responses/bad_request'
require_relative 'responses/forbidden'
require_relative 'responses/list'
require_relative 'responses/not_found'
require_relative 'responses/not_implemented'
require_relative 'responses/record'
require_relative 'responses/unauthorized'
require_relative 'responses/unprocessable_entity'

module MarbleApiClient
  # Module for getting response objects
  module Responses
    INDEX_ACTION = 'index'
    CREATE_ACTION = 'create'

    SUCCESS_RESPONSE_CODE = '200'
    BAD_REQUEST_RESPONSE_CODE = '400'
    UNAUTHORIZED_RESPONSE_CODE = '401'
    FORBIDDEN_RESPONSE_CODE = '403'
    NOT_FOUND_RESPONSE_CODE = '404'
    UNPROCESSABLE_ENTITY_RESPONSE_CODE = '422'
    SERVER_ERROR_RESPONSE_CODE = '500'
    NOT_IMPLEMENTED_RESPONSE_CODE = '501'

    RESPONSES = [
      {
        code: SUCCESS_RESPONSE_CODE,
        class_constant: Success
      },
      {
        code: SUCCESS_RESPONSE_CODE,
        action: INDEX_ACTION,
        class_constant: List
      },
      {
        code: SUCCESS_RESPONSE_CODE,
        action: CREATE_ACTION,
        class_constant: Record
      },
      {
        code: BAD_REQUEST_RESPONSE_CODE,
        class_constant: BadRequest
      },
      {
        code: UNAUTHORIZED_RESPONSE_CODE,
        class_constant: Unauthorized
      },
      {
        code: FORBIDDEN_RESPONSE_CODE,
        class_constant: Forbidden
      },
      {
        code: NOT_FOUND_RESPONSE_CODE,
        class_constant: NotFound
      },
      {
        code: UNPROCESSABLE_ENTITY_RESPONSE_CODE,
        class_constant: UnprocessableEntity
      },
      {
        code: SERVER_ERROR_RESPONSE_CODE,
        class_constant: ServerError
      },
      {
        code: NOT_IMPLEMENTED_RESPONSE_CODE,
        class_constant: NotImplemented
      }
    ].freeze

    class << self
      def parse_response(response, action)
        raise ArgumentError, 'HTTPResponse required' unless response.is_a?(Net::HTTPResponse)

        find_object(response, action)[:class_constant].new(response)
      end

      private

      def find_object(response, action)
        code_search = create_searches(response.code)
        find_by_code_and_action(response.code, action, code_search)
      end

      # Creates cascading searches using lambdas and the find ifnone argument.
      # Shortcircuits at first found object and returns it.
      def create_searches(code)
        none_found = lambda do
          raise ArgumentError, "Unexpecred HTTResponse: #{code}"
        end

        rounded_code_search = lambda do
          RESPONSES.find(none_found) { |r| r[:action].nil? && r[:code] == rounded_code(code) }
        end

        lambda do
          RESPONSES.find(rounded_code_search) { |r| r[:action].nil? && r[:code] == code }
        end
      end

      def find_by_code_and_action(code, action, ifnone)
        RESPONSES.find(ifnone) do |r|
          r[:code] == code && r[:action] == action
        end
      end

      def rounded_code(code)
        code.to_i.floor(-2).to_s
      end
    end
  end
end
