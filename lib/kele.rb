require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    @base_url = "https://www.bloc.io/api/v1/"
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": password})
    raise "invalid email/pass, bud" if response.code != 200
    @auth_token = response["auth_token"]
  end

  def get_me
    url = @base_url + "users/me"
    JSON.parse(self.class.get(url, headers: { "authorization" => @auth_token }).body)
  end

  def get_mentor_availability(mentor_id)
		url = @base_url + "mentors/#{mentor_id}/student_availability"
		JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
	end
end
