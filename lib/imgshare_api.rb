class ImgshareApi
  include HTTParty

  # debug_output $stdout

  def initialize(api_key: )
    @api_key = api_key
    @options = {
      headers: {
        "X-Api-Key" => @api_key
      }
    }
  end

  base_uri "http://localhost:3000/api/v1"
  format :json

  def upload(file_path)
    self.class.post("/images", { body: { file: File.open(file_path) }}.merge(@options))
  end
end
