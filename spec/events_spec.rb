describe 'Event' do
  it 'Renders all the events sorted by timestamp descending' do
    response = FireAMP.get '/v1/events', @common_options.merge(query: FireAMP.common_parameters.merge(limit: 1))
    expect(response.code).to eql(200)
  end

  it 'Event Filters Usage' do
    response = FireAMP.get '/v1/events', @common_options.merge(query: FireAMP.common_parameters.merge(threat_detected_event))
    expect(response.code).to eql(200)
  end

  def threat_detected_event
    return @event if @event
    event_type_id = 1090519054 # Threat Detected
    event = FireAMPDirect.get('/v1/events', @common_options.merge(query: FireAMP.common_parameters.merge(limit: 1, event_type: [event_type_id])))['data']['items'].first

    @event = {
        connector_guid:     event['computer']['guid'],
        detection_sha256:   event['file']['identity']['sha256'],
        application_sha256: event['network_info']['parent']['identity']['sha256'],
        start_date:         Date.new(2015, 1, 1),
        event_type:         [event['event_type_id'].to_i]
    }
  end
end