shared_examples 'dnsclient' do
  describe 'dnsclient profile' do
    describe file('/etc/resolv.conf') do
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
      its(:content) { should match /search ec2\.internal/ }
    end
  end
end
