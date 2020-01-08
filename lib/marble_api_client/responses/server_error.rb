# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # Represents an HTTP 500 response. This will encompass all errors in the 500-599 range.
    class ServerError
      include HttpMethods
      include BodyAttributes

      body_attributes :errors

      def initialize(response)
        @response = response
      end
    end
  end
end
