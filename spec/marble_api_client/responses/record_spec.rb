# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::Record do
  context 'provides' do
    let(:record) { { name: 'record_1' }.to_json }
    let(:response) do
      instance_double(Net::HTTPResponse, code: 400, body: { record: record }.to_json)
    end

    specify 'errors' do
      expect(described_class.new(response).record)
        .to eq(record)
    end
  end
end
