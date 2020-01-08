# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # Represents an HTTP 200 responses.
    # Adds additional properties to the Success class specific to Create requests.
    class Record < Success
      body_attributes :record
    end
  end
end
