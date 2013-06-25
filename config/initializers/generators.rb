# don't generate RSpec tests for views and helpers by default
Rails.application.config.generators do |g|
  g.view_specs false
  g.helper_specs false
  g.stylesheets false
  g.helper false
  g.javascripts false
  g.template_engine :haml
  # g.form_builder :simple_form
  g.test_framework :rspec, fixture: true, view_specs: false
  g.fixture_replacement :factory_girl, dir: "spec/factories"
end