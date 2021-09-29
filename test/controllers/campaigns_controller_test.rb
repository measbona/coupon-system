require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get campaigns_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_url
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { charset: @campaign.charset, code_count: @campaign.code_count, code_length: @campaign.code_length, ended_at: @campaign.ended_at, name: @campaign.name, prefix: @campaign.prefix, started_at: @campaign.started_at, suffix: @campaign.suffix } }
    end

    assert_redirected_to campaign_url(Campaign.last)
  end

  test "should show campaign" do
    get campaign_url(@campaign)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_url(@campaign)
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { charset: @campaign.charset, code_count: @campaign.code_count, code_length: @campaign.code_length, ended_at: @campaign.ended_at, name: @campaign.name, prefix: @campaign.prefix, started_at: @campaign.started_at, suffix: @campaign.suffix } }
    assert_redirected_to campaign_url(@campaign)
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign)
    end

    assert_redirected_to campaigns_url
  end
end
