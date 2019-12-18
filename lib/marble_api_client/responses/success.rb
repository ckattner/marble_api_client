# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # 200 Response Base Class
    class Success
      include HttpMethods
      include BodyAttributes

      def initialize(response)
        @response = response
      end
    end
  end
end
