class Kele
  def get_roadmap(chain_id)
    url = @base_url + "roadmaps/#{chain_id}"
    JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
  end

  def get_checkpoint(checkpoint_id)
    url = @base_url + "checkpoints/#{checkpoint_id}"
    JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
  end

  def get_remaining_checkpoints(chain_id)
    url = @base_url + "enrollment_chains/#{chain_id}/checkpoints_remaining_in_section"
    JSON.parse(self.class.get(url, headers: {"authorization" => @auth_token}).body)
  end
end
