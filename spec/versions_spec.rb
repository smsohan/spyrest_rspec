describe "Version" do
  it 'Renders the current API version' do
    response = FireAMP.get '/v1/version', @common_options.merge(query: FireAMP.common_parameters)
    expect(response.code).to eql(200)
  end
end