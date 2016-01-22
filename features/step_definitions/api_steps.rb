When /^I search for sections$/ do
  @response = Regis.client.sections_get_by_reporting_term($REGIS_TEST_VALUES['reporting_term'])
end

Then /^I should receive a list of sections$/ do
  expect(@response.sections.count > 0).to be true
end

When /^I reset the section cache$/ do
  Regis.client.configuration.cache.delete("/Section/#{$REGIS_TEST_VALUES['section_uuid']}?format=json")
end

When /^I ask for a section$/ do
  @response = Regis.client.section_get_by_uuid($REGIS_TEST_VALUES['section_uuid'])
end

Then /^I should receive the section I asked for$/ do
  expect(@response.section.secUUID == $REGIS_TEST_VALUES['section_uuid']).to be true
end

Then /^I should have populated section values$/ do
  expect(@response.section.secUUID).not_to be_empty
  expect(@response.section.reporting_term).not_to be_empty
  expect(@response.section.course_name).not_to be_empty
  expect(@response.section.course_title).not_to be_empty
  expect(@response.section.credits_long_name).not_to be_empty
end

Then /^I should have an instructor$/ do
  expect(@response.section.instructors[0].regent_id).to be > 0
end

Then /^I should have a cached response$/ do
  response = Regis.client.configuration.cache.read("/Section/#{$REGIS_TEST_VALUES['section_uuid']}?format=json")
  expect(response).to be_instance_of(Faraday::Response)
end