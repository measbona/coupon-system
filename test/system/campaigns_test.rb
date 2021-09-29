require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "visiting the index" do
    visit campaigns_url
    assert_selector "h1", text: "Campaigns"
  end

  test "creating a Campaign" do
    visit campaigns_url
    click_on "New Campaign"

    fill_in "Charset", with: @campaign.charset
    fill_in "Code count", with: @campaign.code_count
    fill_in "Code length", with: @campaign.code_length
    fill_in "Ended at", with: @campaign.ended_at
    fill_in "Name", with: @campaign.name
    fill_in "Prefix", with: @campaign.prefix
    fill_in "Started at", with: @campaign.started_at
    fill_in "Suffix", with: @campaign.suffix
    click_on "Create Campaign"

    assert_text "Campaign was successfully created"
    click_on "Back"
  end

  test "updating a Campaign" do
    visit campaigns_url
    click_on "Edit", match: :first

    fill_in "Charset", with: @campaign.charset
    fill_in "Code count", with: @campaign.code_count
    fill_in "Code length", with: @campaign.code_length
    fill_in "Ended at", with: @campaign.ended_at
    fill_in "Name", with: @campaign.name
    fill_in "Prefix", with: @campaign.prefix
    fill_in "Started at", with: @campaign.started_at
    fill_in "Suffix", with: @campaign.suffix
    click_on "Update Campaign"

    assert_text "Campaign was successfully updated"
    click_on "Back"
  end

  test "destroying a Campaign" do
    visit campaigns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campaign was successfully destroyed"
  end
end
