class GeocodesController < ApplicationController
  def getaddress
    address =
      RestClient.get(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{
          params['lat']
        },#{params['lng']}&key=#{ENV['REACT_APP_GOOGLE_API_KEY']}"
      )

    render json: address
  end

  def getdetails
    res =
      RestClient.get(
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{
          params[:id]
        }&key=#{ENV['REACT_APP_GOOGLE_API_KEY']}"
      )

    render json: res
  end
  # https://maps.googleapis.com/maps/api/place/textsearch/json?query=123+main+street&location=42.3675294,-71.186966&radius=10000&key=YOUR_API_KEY

  def get_coords
    res =
      RestClient.get(
        "https://maps.googleapis.com/maps/api/geocode/json?address=#{
          params[:address]
        }&key=#{ENV['REACT_APP_GOOGLE_API_KEY']}"
      )
    res = JSON.parse(res)
    coords = {}
    coords['lat'] = res['results'][0]['geometry']['location']['lat']
    coords['lng'] = res['results'][0]['geometry']['location']['lng']

    render json: coords
  end

  def nearby_search
    distance = params[:distance].to_i * 1609
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    distance = '50000' if distance > 50_000

    url =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{
        lat.to_s
      },#{lng.to_s}&radius=#{distance.to_s}&type=doctor&keyword=ankle&key=#{
        ENV['REACT_APP_GOOGLE_API_KEY']
      }"
    res = RestClient.get(url)

    render json: res
  end
end
