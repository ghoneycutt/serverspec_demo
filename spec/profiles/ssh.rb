shared_examples 'ssh' do
  describe 'ssh profile' do
    describe port(22) do
      it { should be_listening }
    end
  end
end
