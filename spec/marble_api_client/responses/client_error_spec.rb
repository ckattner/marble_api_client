# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::ClientError do
  let(:error_hash) { { name: 'invalid' }.to_json }
  let(:response) do
    instance_double(Net::HTTPResponse, code: 400, body: { errors: error_hash }.to_json)
  end

  it 'has access to response code' do
    expect(described_class.new(response).code).to eq(400)
  end
end
