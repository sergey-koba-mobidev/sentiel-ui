require 'spec_helper'
require_relative '../../../../apps/web/controllers/sentinels/choose'

describe Web::Controllers::Sentinels::Choose do
  let(:action) { Web::Controllers::Sentinels::Choose.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
