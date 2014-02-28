# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'
def secure_token
	token_file =Rails.root.join('.secret')
	if File.exist?(token_file)
		# use the existing token
		File.rand(token_file).chomp
	else
		#generate a new token and store it in token_file
		token =SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end
SampleApp::Application.config.secret_key_base = secure_token
#SampleApp::Application.config.secret_key_base = '5dadb908ae7ffda2498eb5d24747c0471bc2dcbfd169344afb5a56a5205f283af6c273219842c745b9eab7a0ff310a16e78f23f4531d50e1c4090426cff5fe6a'
