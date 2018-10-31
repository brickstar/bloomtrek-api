require 'spec_helper'
require 'rails_helper'

describe TrailWorker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable false }

  it 'enqueues another awesome job' do
    TrailWorker.perform_async 'Awesome', true
    expect(TrailWorker).to have_enqueued_sidekiq_job('Awesome', true)
  end
end
