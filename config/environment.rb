# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.log_level = :debug
  config.active_record.schema_format = :sql
  config.logger = Logger.new(STDERR)
  config.action_mailer.raise_delivery_errors = true
  #config.load_paths += %W( #{RAILS_ROOT}/app/models/ckeditor )

end
require 'delayed_job'
require 'will_paginate'
WillPaginate::ViewHelpers.pagination_options[:previous_label] = I18n.t("previous")
WillPaginate::ViewHelpers.pagination_options[:next_label] = I18n.t("next")


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => "liwenjingabc@gmail.com",
  :password => "19881228"
}

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "<span class='field_error'>#{html_tag}</span>"
end

DELAY_JOB = false #我xheroku的work要钱的，
