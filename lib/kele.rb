require 'httparty'

class Kele
  include HTTParty

  base_uri "bloc.io/api/v1"

  def initialize(email, password)
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": password})
    raise "invalid email/pass, bud" if response.code != 200
    @auth_token = response["auth_token"]
  end
end
