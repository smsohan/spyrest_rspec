describe "Version" do
  it 'Renders the current API version' do

    puts "FireAMP.common_parameters = #{FireAMP.common_parameters}"

    response = FireAMP.get '/v1/version.json', @common_options.merge(query: FireAMP.common_parameters)
    expect(response.status).to eql(200)
  end
end