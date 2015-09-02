describe 'EventType' do
  it 'Renders all event types' do
    response = FireAMP.get '/v1/event_types', @common_options.merge(query: FireAMP.common_parameters)
    expect(response.code).to eql(200)
  end
end