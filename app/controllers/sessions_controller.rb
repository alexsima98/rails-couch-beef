class SessionsController < ApplicationController
  # you need to put access permissions

  # they are a lot of common actions you can put in before_action
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
      @session.win_price += @session.price
      @session.user.save
      @session.save
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
    # all the params can be retrieve with require when they are nested
    #  you can fetch them if they are mandatory but can be nil,
    #  you can require them if they are mandatory AND can not be nil
    #  or just access them if they are not mandatoray
    #       => params.require(:session)[:session_id]
    @session = Session.find(params.require(:session).fetch(:session_id))
    @session.score1 = params["session"]["score1"]
    @session.score2 = params["session"]["score2"]
    @session.status = "finished"
    @session.scoresub = current_user.username
    @session.save
    redirect_to lobby_session_path(@session.lobby, @session)
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
    if current_user.wallet > @session.price
      current_user.wallet -= @session.price
      @session.win_price += @session.price
      @session.save
      current_user.save
      # CREATING A USER INVITE
      @user_invite = UserInvite.new
      @user_invite.user = current_user
      @user_invite.session = @session
      @user_invite.save
    else
      # random comment
      flash[:alert] = 'Not enough money'
    end
    redirect_to lobby_session_path(@lobby, @session)

  end

  private

  def session_params
    params.require(:session).permit(:price, :win_price, :platform, :score1, :score2, :scoresub, :winner, :team_type, :star_level, :half_length, :custom_rules, :legacy_depending, :match_type)
  end

  def agreed?
  end
end
