describe "version" do
  it 'renders the current API version' do
    FireAMP.get 'v1/version.json', @common_options
  end
end