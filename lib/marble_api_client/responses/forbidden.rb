# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # 403 Response Class
    class Forbidden < ClientError
      STATUS_CODE = 'statusCode'
      REDIRECT_URL = 'redirectUrl'
      def initialize(response)
        super
      end

      def status_code
        parsed_body.dig(STATUS_CODE)
      end

      def redirect_url
        parsed_body.dig(REDIRECT_URL)
      end
    end
  end
end
