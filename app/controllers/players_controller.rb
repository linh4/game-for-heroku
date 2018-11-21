class PlayersController < ActionController::API

  def index
    @players = Player.all
    render json: @players, include: ['games']
  end

  def top_score
    @player = Player.find(params[:id])
    render json: @player.games.sort{|a, b| b.highest_level <=> a.highest_level}[0]
  end

  def show
    @player = Player.find(params[:id])
    render json: @player, include: ['games']
  end

  # def create
  #   @player = Player.new(player_params)
  #     if @player.save
  #       render json: @player, status: :created, location: @player
  #     else
  #       render json: @player.errors, status: :uprocessable_entity
  #     end
  # end

  # POST to 'http://localhost:3000/players/make' something like this {name: "Name", highest_level: 3}
  # it should return a player and game object
  def create_both
    @player = Player.new(name: player_params[:name])
      if @player.valid?
        # byebug
        @player.save
        @player.games << Game.create!(player_id: @player.id, highest_level: params[:highest_level])
        render json: @player, include: ['games']
      else
        render json: @player.errors, status: :uprocessable_entity
      end
  end

  def update
    @player = Player.find(params[:id])
  end

  private
  def player_params
    params.require(:player).permit(:name, :highest_level)
  end
end
