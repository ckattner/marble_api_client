# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # 422 Response Object
    class UnprocessableEntity < ClientError
      ERRORS = 'errors'
      ERROR_PROPERTIES = 'errorProperties'
      WARNINGS = 'warnings'
      WARNING_PROPERTIES = 'warningProperties'

      def initialize(response)
        super
      end

      def errors
        parsed_body.dig(ERRORS)
      end

      def error_properties
        parsed_body.dig(ERROR_PROPERTIES)
      end

      def warnings
        parsed_body.dig(WARNINGS)
      end

      def warning_properties
        parsed_body.dig(WARNING_PROPERTIES)
      end
    end
  end
end
