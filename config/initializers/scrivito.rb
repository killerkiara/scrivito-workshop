def cms_config
  YAML.load_file(Rails.root + 'config/scrivito.yml')
 rescue Errno::ENOENT
  {}
 end

 Scrivito.configure do |config|
  
 # addition to let you choose which homepage to use?
   config.choose_homepage do |env|
    Page.where(:_path, :equals, '/').first
   end

  config.api_key = ENV['API_KEY'] || cms_config['api_key']
  config.tenant = ENV['TENANT_ID'] || cms_config['tenant']

  # Disable the default routes to allow route configuration
  config.inject_preset_routes = false

  config.editing_auth do |env|
  	session = Rack::Request.new(env).session

  	user = User.new(session[:user])
  	user.to_scrivito_user if user && user.editor?
  end
end