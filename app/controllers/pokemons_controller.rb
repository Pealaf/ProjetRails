class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  # GET /pokemons
  # Récupération de tous les Pokémons
  def index
    @pokemons = Pokemon.all

    render json: @pokemons
  end

  # GET /pokemons/1
  # Récupération d'un Pokémon par son ID
  def show
    render json: @pokemon
  end

  # POST /pokemons
  # Création d'un Pokémon
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  # Modification d'un Pokémon
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  # Suppression d'un Pokémon
  def destroy
    @pokemon.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :type_pokemon, :level, :evolution)
    end
end
