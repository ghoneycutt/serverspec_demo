shared_examples 'ssh' do
  describe 'ssh profile' do
    describe port(22) do
      it { should be_listening }
    end

    # Do not allow SSH as Root as per security policy #123
#    describe file('/etc/ssh/sshd_config') do
#      its(:content) { should match /^\s*PermitRootLogin\s*no\s*$/ }
#    end
  end
end
