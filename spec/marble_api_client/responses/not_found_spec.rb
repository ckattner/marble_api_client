# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::NotFound do
  context 'provides' do
    let(:message) { 'invalid' }
    let(:response) do
      instance_double(Net::HTTPResponse, code: 400, body: { message: message }.to_json)
    end

    it 'errors' do
      expect(described_class.new(response).message)
        .to eq(message)
    end
  end
end
