require 'spec_helper'
require 'rails_helper'

describe TrailWorker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable false }
end
