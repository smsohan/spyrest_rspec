describe 'Event' do
  it 'Renders all the events sorted by timestamp descending' do
    response = FireAMP.get '/v1/events', @common_options.merge(query: FireAMP.common_parameters)
    expect(response.code).to eql(200)
  end

  it 'Filters events by connector guids' do
    params = {connector_guid:     ['c3774873-3653-4064-900a-a54e805c8ccf'],
              detection_sha256:   ['275a021bbfb6489e54d471899f7db9d1663fc695ec2fe2a2c4538aabf651fd0f'],
              application_sha256: ['929d1b2079bde9f6a4d90d25f926b86a44f62c33e9522d3e00bcf3ee06a96492'],
              start_date:         Date.new(2015, 1, 1),
              event_type:         1090519054,
              group_guid: ['e53d5971-ccb7-4f54-99d0-09676a6d2ba5']
    }
    response = FireAMP.get '/v1/events', @common_options.merge(query: FireAMP.common_parameters.merge(params))
    expect(response.code).to eql(200)
  end
end