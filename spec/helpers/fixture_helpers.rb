# frozen_string_literal: true

module FixtureHelpers
  def fixture_file(relpath)
    FIXTURES_ROOT.join('files', relpath)
  end

  def json_fixture(relpath)
    JSON.parse(fixture_file(relpath).read)
  end
end
