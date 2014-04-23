require 'spec_helper'

describe 'cron_test::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge('cron_test::default')
  end

  it 'creates cron_d[bizarrely-scheduled-usage-report]' do
    expect(chef_run).to create_crond_d('bizarrely-scheduled-usage-report').with(
      :minute => '*/5',
      :hour => '1,23',
      :day => '2-5',
      :command => '/srv/app/scripts/generate_report',
      :user => 'appuser'
      )
  end
end
