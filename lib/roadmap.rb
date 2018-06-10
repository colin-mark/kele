class Kele
  def get_roadmap(chain_id)
    url = @base_url + "roadmaps/#{chain_id}"
    JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
  end

  def get_checkpoint(checkpoint_id)
    url = @base_url + "checkpoints/#{checkpoint_id}"
    JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
  end
end
