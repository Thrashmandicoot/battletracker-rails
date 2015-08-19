class Campaign < ActiveRecord::Base
  belongs_to :user

  def index
    bounce
    @user = current_user
  end


  get '/campaigns' do
  bounce
  erb :'campaigns/campaigns'
end

get '/campaigns/:id/characters' do
  bounce
  @id = params[:id]
  @campaign = Campaign.find_by(id:params[:id])
  erb :'campaigns/characters'
end

get '/campaigns/new' do
  bounce
  @user = current_user
  erb :'campaigns/new'
end

post '/campaigns' do
  bounce
  current_user.campaigns << Campaign.create(
    title: params[:title],
    description: params[:description]
  )

  redirect '/campaigns'
end

get '/campaigns/:id/edit' do
  bounce
  @id = params[:id]
  erb :'campaigns/edit'
end

put '/campaigns/:id' do
  bounce
  current_user.campaigns.find_by(id:params[:id]).update_attributes(
    title: params[:title],
    description: params[:description]
  )

  redirect '/campaigns'
end

get '/campaigns/:id/delete' do
  bounce
  Campaign.find_by(id: params[:id]).destroy
  redirect '/campaigns'
end

post '/campaigns/:id/characters/add' do
  bounce
  if Character.find_by(id: params[:charid])
    current_user.campaigns.find_by(id: params[:id]).characters << Character.find_by(id: params[:charid])
  end
  campaign_char_url = "/campaigns/#{params[:id]}/characters"
  redirect campaign_char_url
end




end
