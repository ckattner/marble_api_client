# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # Represents an HTTP 403 responses.
    # Adds additional properties to the ClientError which encompasses the entire 400 level.
    class Forbidden < ClientError
      body_attributes :message, :redirect_url
    end
  end
end
