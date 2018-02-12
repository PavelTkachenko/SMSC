RSpec.describe SMSC::Ping do
  describe "#call" do
    context "CONNECTION_REFUSED" do
      it "returns error" do
        stub_request(:post, "https://smsc.kz/sys/send.php").to_raise(Errno::ECONNREFUSED)
        request = SMSC::Ping.new(login: "login", password: "password")
        expect(request.call(phone: "87776663322").value).to eq(:network_error)
      end
    end

    context "wrong credentials" do
      it "returns error" do
        stub_request(:post, "https://smsc.kz/sys/send.php").to_return(body: File.new('spec/smsc/fixtures/wrong_credentials.json'), status: 200)
        request = SMSC::Ping.new(login: "login", password: "password")
        expect(request.call(phone: "87776663322").value).to eq(:authorize_error)
      end
    end
    context "valid data" do
      it "returns data on success request" do
        stub_request(:post, "https://smsc.kz/sys/send.php").to_return(body: File.new('spec/smsc/fixtures/send.json'), status: 200)
        request = SMSC::Ping.new(login: "login", password: "password")
        expect(request.call(phone: "87776663322").value).to eq({ id: 1, cnt: 1 })
      end
    end
  end
end
