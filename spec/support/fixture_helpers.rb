module FixtureHelpers
  def fixture_file_path(filename)
    Rails.root.join("spec", "fixtures", "files", filename)
  end
end

RSpec.configure do |config|
  config.include FixtureHelpers
end
