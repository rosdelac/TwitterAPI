get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/fetch' do
  p params[:twitterhandle]
  @user = TwitterUser.find_or_create_by(name: params[:twitterhandle])
    if @user.tweets.empty? || !@user.updated?
        Tweet.where(twitter_user_id: @user.id).destroy_all 
        tweets = CLIENT.get_all_tweets(@user.name).take(10)
        tweets.each do |tweet|
          tw = Tweet.create(twitter_user_id: @user.id, body: tweet.text)
        end 
      @tweets = @user.tweets
    else
      @tweets = @user.tweets
    end
  erb :tweets, layout: false
end


post '/tweet' do
    p params[:tweet]
    tweet = CLIENT.update("#{params[:tweet]}")
    "success"
    # Recibe el input del usuario

    # Crea el tweet utilizando la API de Twitter

    # Regresa al usuario el tweet o un mensaje de EXITO o ERROR
end

# get '/:handle' do
#   @user = TwitterUser.find_or_create_by(name: params[:handle])

#   if @user.tweets.empty? || !@user.updated?
#       Tweet.where(twitter_user_id: @user.id).destroy_all 
#       tweets = CLIENT.get_all_tweets(@user.name).take(10)
#       tweets.each do |tweet|
#         tw = Tweet.create(twitter_user_id: @user.id, body: tweet.text)
#       end 
#     @tweets = @user.tweets
#   else
#     @tweets = @user.tweets
#   end
#   erb :tweets, layout: false
# end
