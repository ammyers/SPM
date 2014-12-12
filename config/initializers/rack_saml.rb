if Rails.env.production? #production use project-specific confi
	Rails.application.config.middleware.insert_after Rack::ETag, Rack::Saml, {
		:config => "#{Rails.root}/config/rack-saml-production.yml",
		:metadata => "#{Rails.root}/config/metadata.yml",
		:attribute_map => "#{Rails.root}/config/attribute-map.yml"
	}
else #development or test use normal config 
		Rails.application.config.middleware.insert_after Rack::ETag, Rack::Saml, {
		:config => "#{Rails.root}/config/rack-saml.yml",
		:metadata => "#{Rails.root}/config/metadata.yml",
		:attribute_map => "#{Rails.root}/config/attribute-map.yml"
	}
end