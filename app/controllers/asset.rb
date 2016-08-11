require "sass"
require "sprockets"

require_relative "base"

module Tint
	module Controllers
		class Asset < Controllers::Base
			set :sprockets, Sprockets::Environment.new
			sprockets.append_path "assets/stylesheets"
			sprockets.css_compressor = :scss

			get "/assets/*" do
				skip_authorization
				env["PATH_INFO"].sub!("/assets", "")
				settings.sprockets.call(env)
			end
		end
	end
end