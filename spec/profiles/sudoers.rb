shared_examples 'sudoers' do
  describe 'sudoers profile' do
    describe file('/etc/sudoers') do
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 440 }
    end
  end
end
