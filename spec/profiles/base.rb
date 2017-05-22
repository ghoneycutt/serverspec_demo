shared_examples 'base' do
  describe 'base profile' do

    include_examples 'dnsclient'
    include_examples 'ssh'
    include_examples 'sudoers'
  end
end
