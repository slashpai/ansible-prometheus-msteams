# frozen_string_literal: true

# Molecule managed

describe user('prometheus_msteams') do
  it { should exist }
  its('groups') { should eq %w[users prometheus_msteams] }
  its('shell') { should eq '/usr/sbin/nologin' }
end

describe directory('/etc/prometheus_msteams') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0775' }
end

describe file('/etc/prometheus_msteams/config.yaml') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include 'connectors:' }
  its('content') { should include '- channel1: https://outlook.office.com/webhook/xxx/aaa/abc' }
  its('content') { should include '- channel1: https://outlook.office.com/webhook/xxx/aaa/abc' }
end

describe file('/etc/prometheus_msteams/default-message-card.tmpl') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0755' }
end

describe file('/etc/systemd/system/prometheus_msteams.service') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

describe service('prometheus_msteams.service') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe command('curl http://localhost:2000') do
  its('stdout') { should include 'message":"Not Found"' }
  its('exit_status') { should eq 0 }
end
