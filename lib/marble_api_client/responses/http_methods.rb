# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # This module requires a "response" method which returns an instance of Net::HTTPResponse.
    module HttpMethods
      def code
        @response.code
      end

      def body
        @response.body
      end
    end
  end
end
