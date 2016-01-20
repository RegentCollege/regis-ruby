require 'rubygems'
require 'rspec'

require 'yaml'

require_relative '../../config/initializers/regis'

$REGIS_TEST_VALUES = YAML.load_file("features/config/test_values.yml")