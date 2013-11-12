class TweetsController < ApplicationController
  def index
    # Always get the DB to do the work 
    @tweets = Tweet.order('id DESC')

    # Creates a new tweet
    @tweet = Tweet.new

  end # Automatically load app/views/tweets/index.html.erb

  def create
    # If didnt know where to index to in the params hash -> 
    # view source -> look at the input in the form -> 
    # the params name is always before the properties in the squared braces
    @tweet = Tweet.new(params[:tweet])

    if @tweet.save 
      # If our tweet validates, then redirect.
      redirect_to :action => :index
    else
      @tweets = Tweet.order('id DESC')
      render :action => :index 
    end 
  end

  # index and create functions are DIFFERENT
end
