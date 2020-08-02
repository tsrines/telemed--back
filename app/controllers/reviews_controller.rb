class ReviewsController < ApplicationController
  def index
    render json: Review.all
  end
  def new; end

  def create
    @client = GooglePlaces::Client.new('YOUR_API_KEY')

    @spot = @client.spot(params[:place_id])

    allReviews = []
    review_hash = {}
    if @spot.reviews
      @spot.reviews.as_json.each do |review|
        review_hash['doctor_id'] = params['doctor_id']
        review_hash['place_id'] = params['place_id']
        review_hash['author_name'] = review['author_name']
        review_hash['author_url'] = review['author_url']
        review_hash['profile_photo_url'] = review['profile_photo_url']
        review_hash['rating'] = review['rating']
        review_hash['relative_time_description'] =
          review['relative_time_description']

        review_hash['text'] = review['text']
        # byebug
        review_hash['time'] = review['time']

        newReview = Review.new(review_hash)

        if newReview.save!
          newReview.update(review_hash)
          allReviews.push(newReview)
        else
          render json: 'Sorry broken'
        end
      end
    end

    if allReviews
      render json: allReviews
    else
      render json: { msg: 'No reviews' }
    end
  end

  private

  def review_params
    params.require(:review).permit(:doctor_id, :place_id)
  end
end
