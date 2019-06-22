require File.join(File.dirname(__FILE__), 'app.rb')

use Rack::MethodOverride
run DailyDiary
