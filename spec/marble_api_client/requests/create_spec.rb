# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Requests::Create do
  it 'builds the body' do
    request = MarbleApiClient::Requests::Create.new(
      context: { red: 'blue' },
      record: { green: 'yellow' }
    )

    expected = {
      context: {
        red: 'blue'
      },
      record: {
        green: 'yellow'
      }
    }.to_json

    expect(request.request_body).to eq(expected)
  end
end
