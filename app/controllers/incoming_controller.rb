class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    #puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.

    # Find the user by using params[:sender]
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]
    user_email = params[:sender]
    email_subject = params[:subject]
    email_bookmark = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    user = User.find_by_email(user_email)
    if user.nil?
      user = User.new(
          :email                 => user_email,
          :name                  => user_email,
          :password              => "123456",
          :password_confirmation => "123456"
      )
      user.skip_confirmation!
      user.save!
    end
    #msg = "User id #{user.id}"
    #puts msg
    # Check if the topic is nil, if so, create and save a new topic
    topic = Topic.find_by_title(email_subject)
    if topic.nil?
      topic = Topic.new(
        :title => email_subject,
        :user_id => user.id
      )
      topic.save!
    end
    #msg = "Topic id #{topic.id}"
    #puts msg
    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    # Assuming all went well.
    bookmark = Bookmark.new(
      :topic_id =>   topic.id,
      :user_id => user.id,
      :url =>  email_bookmark.strip
    )
    bookmark.save!
    #msg = "New bookmark id #{bookmark.id}"
    #puts msg
    head 200
  end
end
