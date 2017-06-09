shared_examples 'apache' do
  describe 'apache profile' do
    describe port(80) do
      it { should be_listening }
    end

		describe package('httpd') do
			it { should be_installed }
		end

		describe service('httpd') do
			it { should be_enabled }
			it { should be_running }
		end
  end
end
