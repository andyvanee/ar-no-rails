require 'yaml'
require 'active_record'

ActiveRecord::Base.establish_connection(
    YAML::load(File.open('./database.yml'))
)

ActiveRecord::Base.logger = Logger.new(STDOUT)
