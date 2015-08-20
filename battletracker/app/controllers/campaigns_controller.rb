class CampaignsController < ApplicationController
  before_action :bounce

  def index
    @campaigns = current_user.campaigns
  end

  def characters
    @campaign = Campaign.find_by(id:params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      current_user.campaigns << @campaign
      redirect_to campaign_characters_path(@campaign)
    else
      render "new"
    end
  end

  def edit
    @campaign = Campaign.find_by(id: params[:id])
  end

  def update
    @campaign = Campaign.find_by(id: params[:id])

    if @campaign.update(campaign_params)
      redirect_to campaigns_path
    else
      render 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find_by(id: params[:id])
    @campaign.destroy
  end



  private
  def campaign_params
    params.require(:campaign).permit(:title, :description)
  end

end
