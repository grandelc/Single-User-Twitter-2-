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

    if @tweet.save # Do we pass validation?

      # If position exists then displays the message
      # Can read more info int he rails guide (action_controller_overview)
      # flash when redirecting 
      flash[:success] = "Your tweet was successfully posted."

      # If our tweet validates, then redirect.
      redirect_to :action => :index
    else
      @tweets = Tweet.order('id DESC')

      # Adds the values in the same request and become available immediately
      # flash.now when rendering
      flash.now[:error] = "Sorry, all tweets must be 1 to 140 characters in length."
      render :action => :index 
    end 
  end # No associated view is loaded, we either redirect or render .

  # index and create functions are DIFFERENT
end
