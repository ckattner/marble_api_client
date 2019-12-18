# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient do
  it 'has a version number' do
    expect(MarbleApiClient::VERSION).not_to be nil
  end

  specify 'client returns a MarbleApiClient::Client' do
    expect(MarbleApiClient.client('http://www.example.com'))
      .to be_a(MarbleApiClient::Client)
  end
end
