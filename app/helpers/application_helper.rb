module ApplicationHelper

   def omniauth_authorize_path(resource_name, provider)
    send "#{resource_name}_#{provider}_omniauth_authorize_path"
  end

end
