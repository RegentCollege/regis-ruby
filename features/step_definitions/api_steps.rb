When /^I search for sections$/ do
  @response = Regis.client.sections_get_by_reporting_term($REGIS_TEST_VALUES['reporting_term'])
end

Then /^I should receive a list of sections$/ do
  expect(@response.sections.count > 0).to be true
end

When /^I ask for a section$/ do
  @response = Regis.client.section_get_by_uuid($REGIS_TEST_VALUES['section_uuid'])
end

Then /^I should receive the section I asked for$/ do
  expect(@response.section.uuid == $REGIS_TEST_VALUES['section_uuid']).to be true
end