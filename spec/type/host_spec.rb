require 'spec_helper'

include Specinfra::Helper::RedHat

describe host('127.0.0.1') do
  it { should be_resolvable }
end

describe host('invalid-name') do
  it { should_not be_resolvable }
end

describe host('127.0.0.1') do
  it { should be_resolvable.by('hosts') }
end

describe host('invalid-name') do
  it { should_not be_resolvable.by('hosts') }
end

describe host('127.0.0.1') do
  it { should be_resolvable.by('dns') }
end

describe host('invalid-name') do
  it { should_not be_resolvable.by('dns') }
end

describe host('127.0.0.1') do
  it { should be_reachable }
end

describe host('invalid-host') do
  it { should_not be_reachable }
end

describe host('127.0.0.1') do
  it { should be_reachable.with(:proto => "icmp", :timeout=> 1) }
end

describe host('127.0.0.1') do
  it { should be_reachable.with(:proto => "tcp", :port => 22, :timeout=> 1) }
end

describe host('127.0.0.1') do
  it { should be_reachable.with(:proto => "udp", :port => 53, :timeout=> 1) }
end

describe host('invalid-host') do
  it { should_not be_reachable.with(:proto => "udp", :port => 53, :timeout=> 1) }
end

describe host('example.jp') do
  let(:stdout) { "1.2.3.4\r\n" }
  its(:ipaddress) { should eq '1.2.3.4' }
end