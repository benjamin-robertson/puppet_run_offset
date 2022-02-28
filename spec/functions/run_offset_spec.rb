# frozen_string_literal: true

require 'spec_helper'

describe 'puppet_run_offset::run_offset' do
  # please note that these tests are examples only
  # you will need to replace the params and return value
  # with your expectations
  it { is_expected.to run.with_params(1800, 24, 172_802, 48).and_return(true) }
  it { is_expected.to run.with_params(1800, 6, 25_000, 6).and_return(false) }
  it { is_expected.to run.with_params(nil).and_raise_error(StandardError) }
end
