class CharactersController < ApplicationController
  before_action :bounce

  def index
    # bounce
    @user = current_user
  end

  def new
    # bounce
    @character = Character.new
  end

  def create
    # bounce
    @character = Character.new(character_params)
    if @character.save
      current_user.characters << @character
      redirect_to characters_path
    else
      p 'hello'
      render 'new'
    end
  end

  def destroy
    # bounce
    Character.find_by(id: params[:id]).destroy
    redirect_to characters_path
  end

  def edit
    # bounce
    @character = Character.find_by(id: params[:id])
    # @id = params[:id]
  end

  def update
    # bounce
    @character = Character.find_by(id: params[:id])
    if @character.update(character_params)
      redirect_to characters_path
    else
      render 'edit'
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :job, :total_hp, :current_hp, :armor_class, :initiative, :alive)
  end
end
