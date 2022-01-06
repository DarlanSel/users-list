class UsersController < ApplicationController
  def index
    @users = User.all.order(:name).page(params[:page]).per(10)
  end

  def download_users
    api_params = { nat: 'br', results: 30, inc: 'gender,name,email,picture', seed: 'giga' }

    response = JSON(RestClient.get('https://randomuser.me/api/', content_type: :json, params: api_params))

    response.deep_symbolize_keys!

    User.bulk_create_from_response response[:results]

    redirect_to root_path
  end
end
