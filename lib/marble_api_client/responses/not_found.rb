# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # 404 Response Class
    class NotFound < ClientError
      ERRORS = 'errors'

      def initialize(response)
        super
      end

      def errors
        parsed_body.dig(ERRORS)
      end
    end
  end
end
