require "test_helper"

class ChampionLolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @champion_lol = champion_lols(:one)
  end

  test "should get index" do
    get champion_lols_url, as: :json
    assert_response :success
  end

  test "should create champion_lol" do
    assert_difference("ChampionLol.count") do
      post champion_lols_url, params: { champion_lol: { difficulty: @champion_lol.difficulty, name: @champion_lol.name, price: @champion_lol.price, role: @champion_lol.role } }, as: :json
    end

    assert_response :created
  end

  test "should show champion_lol" do
    get champion_lol_url(@champion_lol), as: :json
    assert_response :success
  end

  test "should update champion_lol" do
    patch champion_lol_url(@champion_lol), params: { champion_lol: { difficulty: @champion_lol.difficulty, name: @champion_lol.name, price: @champion_lol.price, role: @champion_lol.role } }, as: :json
    assert_response :success
  end

  test "should destroy champion_lol" do
    assert_difference("ChampionLol.count", -1) do
      delete champion_lol_url(@champion_lol), as: :json
    end

    assert_response :no_content
  end
end
