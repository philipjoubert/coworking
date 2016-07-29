###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

activate :google_drive, load_sheets: {
    mysheet: "1iVOnhwQpCXC0yzf_PsuX3F93lwqXelJ9c-uaNcVRg28",
}

data.mysheet['spaces'].each do |space|
  proxy "/#{space['city_slug']}/#{space['slug']}/index.html", "space.html", :locals => { :slug => space['slug'], :title => space['name'], :page_type => 'space', :space => space }
end

data.mysheet['cities'].each do |city|
  proxy "/#{city['slug']}/index.html", "city.html", :locals => { :slug => city['slug'], :title => city['name'], :page_type => 'city', :city => city }
end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

set :absolute_prefix, "http://10.0.1.3:4567"

set :app_name, 'Coworking South Africa'
set :app_meta_description, 'Find coworking spaces in Cape Town, Johannesburg and Durban'

set :segment_key, "FyhSmpYYlVq0eWfA80EiZWG6b7UElWz6"

set :facebook_app_id, '532770076892682'
set :twitter, 'offerzen'
set :twitter_account_id, '3852578114'

activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

ignore "/space.html"
ignore "/city.html"

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  set :absolute_prefix, "https://www.coworkingsa.co.za"
  set :segment_key, "6sZCVltMYJfU8ZUbXXZexVwBmmo6WvRY"
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
