class Api::HotelsController < ApplicationController
  require 'faraday'
  require 'json'

  def search
    access_token = fetch_access_token

    api_url = "https://app.boomnow.com/open_api/v1/listings"

    response = Faraday.get(api_url) do |req|
      req.headers['Accept'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{access_token}"
      # Add query parameters based on your needs:
      req.params['city'] = params[:city] if params[:city].present?
      req.params['adults'] = params[:adults] if params[:adults].present?
      req.params['check_in'] = params[:check_in] if params[:check_in].present?
      req.params['check_out'] = params[:check_out] if params[:check_out].present?
    end

    render json: JSON.parse(response.body)
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def fetch_access_token
    auth_url = "https://app.boomnow.com/open_api/v1/auth/token"
    response = Faraday.post(auth_url) do |req|
      req.headers['Accept'] = 'application/json'
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        client_id: ENV['BOOMNOW_CLIENT_ID'],
        client_secret: ENV['BOOMNOW_CLIENT_SECRET']
      }.to_json
    end

    if response.status == 201
      body = JSON.parse(response.body)
      body['access_token']
    else
      raise "Failed to fetch access token: #{response.body}"
    end
  end
end
