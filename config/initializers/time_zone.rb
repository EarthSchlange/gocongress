# Times are always stored in the database in UTC.  However, Rails allows us to
# set a "display timezone".  Our default display timezone will be UTC, but we
# actually want to set the display timezone on a per-year basis, because the
# congress happens in a different timezone each year. The actual display
# timezone will be set in application_controller.rb
Rails.application.configure do
  config.time_zone = "UTC"
end
