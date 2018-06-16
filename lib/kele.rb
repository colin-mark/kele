require 'httparty'
require 'json'
require 'roadmap'

class Kele
  include HTTParty

  def initialize(email, password)
    @base_url = "https://www.bloc.io/api/v1/"
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": password})
    raise "invalid email or password" if response.code != 200
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

  def get_messages(value = 0)
		url = @base_url + "message_threads"
		if value > 0
			JSON.parse(self.class.get(url, values: {page: value}, headers: {"authorization" => @auth_token}).body)
		else
			JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
		end
	end

  def create_message(sender, recipient_id, subject, stripped_text, token_id = nil)
    url = @base_url + "messages"
    if token_id != nil
      self.class.post(url, body: {sender: sender, recipient_id: recipient_id, subject: subject, "stripped-text": stripped_text, token: token_id}, headers: { "authorization" => @auth_token })
    else
      self.class.post(url, body: {sender: sender, recipient_id: recipient_id, subject: subject, "stripped-text": stripped_text}, headers: { "authorization" => @auth_token })
    end
  end
end
