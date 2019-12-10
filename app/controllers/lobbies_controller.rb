class LobbiesController < ApplicationController
  def index
    @lobbies = Lobby.all
  end

  def show
    @lobby = Lobby.find(params[:id])
    @sessions = Session.select { |s| s.lobby_id == @lobby.id }
  end
end
