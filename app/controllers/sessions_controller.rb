class SessionsController < ApplicationController
  def show
    @lobby = Lobby.find(params[:lobby_id])
    @session = Session.find(params[:id])
    @user_invite = UserInvite.new
    @users = User.all
    @message = Message.new
  end

  def new
    @session = Session.new
    @lobby = Lobby.find(params[:lobby_id])
  end

  def create
    @session = Session.new(session_params)
    @lobby = Lobby.find(params[:lobby_id])
    @session.user = current_user
    @session.lobby = @lobby
    if @session.save
      @session.user.wallet -= @session.price
      @session.user.save
      redirect_to lobby_session_path(@lobby, @session)
    else
      render :new
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    @session.user.wallet += @session.price
    redirect_to lobby_path(@session.lobby)
  end

  def submit_score
    @session = Session.find(params["session"]["session_id"])
    @session.score1 = params["session"]["score1"]
    @session.score2 = params["session"]["score2"]
    @session.status = "finished"
    @session.scoresub = current_user.username
    @session.save
  end

  def agreed
    @lobby = Lobby.find(params["lobby_id"])
    @session = Session.find(params["session_id"])
    if @session.score1 > @session.score2
      @session.winner = @session.user.username
      @session.user.wallet += @session.win_price
      @session.user.save
    elsif @session.score1 < @session.score2
      @winner = @session.user_invites.first.user
      @session.winner = @winner.username
      @winner.wallet += @session.win_price
      @winner.save
    end
    @session.status = "agreed"
    @session.save
    redirect_to lobby_session_path(@lobby, @session)
  end

  def joining_session
    # REMOVING MONEY FROM THE WALLET AND ADD IT TO PRICE
    @session = Session.find(params[:session_id])
    @lobby = Lobby.find(@session.lobby_id)
    current_user.wallet -= @session.price
    @session.win_price += @session.price

    current_user.save!
    # CREATING A USER INVITE
    @user_invite = UserInvite.new
    @user_invite.user = current_user
    @user_invite.session = @session
    @user_invite.save

    redirect_to lobby_session_path(@lobby, @session)
  end

  private

  def session_params
    params.require(:session).permit(:price, :win_price, :platform, :score1, :score2, :scoresub, :winner)
  end

  def agreed?

  end
end
