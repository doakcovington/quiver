#Loading an environment
require './config/environment'

#Establishes connection to Database
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride

use SkisController #Mounts the ski controller
use UsersController #Mounts the user controller
run ApplicationController #main controller
