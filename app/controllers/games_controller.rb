class GamesController < ActionController::API

  def index
    @games = Game.all
    render json: @games, include: ['player']
  end

  def score_board
    render json: Game.high_scores, include: ['player']
  end

  def show
    @game = Game.find(params[:id])
    render json: @game, include: ['player']
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update!(game_params)
      render json: @game, status: :updated, location: @games
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end




  private
  def game_params
    params.require(:game).permit(:player_id, :highest_level)
  end
end
