class ChampionLolsController < ApplicationController
  before_action :set_champion_lol, only: %i[ show update destroy ]

  # GET /champion_lols
  # Récupération de tous les champions de LOL
  def index
    @champion_lols = ChampionLol.all

    render xml: @champion_lols.as_json
  end

  # GET /champion_lols/1
  # Récupération d'un champion de LOL par son ID
  def show
    render xml: @champion_lol.as_json
  end

  # POST /champion_lols
  # Création d'un champion de LOL
  def create
    data = Hash.from_xml(request.body.read)
    @champion_lol = ChampionLol.new(data["champion_lol"])

    if @champion_lol.save
      render xml: @champion_lol.as_json, status: :created, location: @champion_lol
    else
      render xml: @champion_lol.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /champion_lols/1
  # Modification d'un champion de LOL
  def update
    data = Hash.from_xml(request.body.read)
    if @champion_lol.update(data["champion_lol"])
      render xml: @champion_lol.as_json
    else
      render xml: @champion_lol.errors, status: :unprocessable_entity
    end
  end

  # DELETE /champion_lols/1
  # Suppression d'un champion de LOL par son ID
  def destroy
    @champion_lol.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champion_lol
      @champion_lol = ChampionLol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def champion_lol_params
      params.require(:champion_lol).permit(:name, :role, :difficulty, :price)
    end
end
