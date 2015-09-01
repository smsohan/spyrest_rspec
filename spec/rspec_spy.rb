RSpec.configure do |config|
  config.before(:each) do |example|
    headers = {
      'x-spy-rest-desc' => example.description,
      'x-spy-rest-resource' => example.example_group.description
    }
    @common_options = {
      verify: false,
      headers: headers
    }
  end
end
