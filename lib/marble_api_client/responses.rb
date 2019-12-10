# frozen_string_literal: true

require_relative 'responses/http_methods'

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
  # Module for all response objects
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
      def get_response_object(response, action)
        raise ArgumentError, 'HTTPResponse required' unless response.is_a?(Net::HTTPResponse)

        response_object = RESPONSES.find do |r|
          r[:code] == response.code && (r[:action] ? r[:action] == action : true)
        end
        raise ArgumentError, "Unexpecred HTTResponse: #{response.code}" unless response_object

        response_object[:class_constant].new(response)
      end
    end
  end
end
