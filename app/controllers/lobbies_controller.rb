class LobbiesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @lobbies = Lobby.all
  end

  def show
    @lobby = Lobby.find(params[:id])
    @sessions = Session.where(lobby_id: @lobby.id)
  end
end
