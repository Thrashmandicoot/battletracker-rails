class CharactersController < ApplicationController
  def index
    bounce
    @user = current_user
  end

  def new
    bounce
  end

  def create
    bounce
    @character = Character.new(character_params)
    if @character.save
      current_user.characters << @character
      redirect_to characters_path
    else
      render 'new'
    end
  end

  def destroy
    bounce
    Character.find_by(id: params[:id]).destroy
    redirect_to characters_path
  end

  def edit
    bounce
    @id = params[:id]
  end

  def update
    bounce
    @character = Characters.find_by(id: params[:id])

    if @character.update(character_params)
      redirect_to characters_path
    else
      render 'edit'
    end
  end

  erb :'characters/new', layout: false

  erb :'characters/edit', layout: false
  # TRY  BEFORE EACH SYNTAX


  private

  def character_params
    params.require(:character).permit(
      name: params[:name],
      job: params[:class],
      total_hp: params[:hp],
      current_hp: params[:hp],
      armor_class: params[:ac],
      initiative: params[:init],
      alive: true
    )
  end
end
