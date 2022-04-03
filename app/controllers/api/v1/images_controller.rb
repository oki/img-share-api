class Api::V1::ImagesController < ApiBaseController
  def create
    image = Image.new(image_params)
    image.api_key = current_api_key
    image.save!

    render json: {
      status: :ok,
      url: image_preview_url(image.hashid)
    }
  end

  private

  def image_params
    params.permit(:file)
  end
end
