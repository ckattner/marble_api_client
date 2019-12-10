# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Requests
    # Create Request Object
    class Create
      def initialize(context: {}, record: {})
        @context = context
        @record = record
      end

      def request_body
        {
          context: @context,
          record: @record
        }.to_json
      end
    end
  end
end
