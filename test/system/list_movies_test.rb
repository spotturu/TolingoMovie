require "application_system_test_case"

class ListMoviesTest < ApplicationSystemTestCase
  setup do
    @list_movie = list_movies(:one)
  end

  test "visiting the index" do
    visit list_movies_url
    assert_selector "h1", text: "List Movies"
  end

  test "creating a List movie" do
    visit list_movies_url
    click_on "New List Movie"

    click_on "Create List movie"

    assert_text "List movie was successfully created"
    click_on "Back"
  end

  test "updating a List movie" do
    visit list_movies_url
    click_on "Edit", match: :first

    click_on "Update List movie"

    assert_text "List movie was successfully updated"
    click_on "Back"
  end

  test "destroying a List movie" do
    visit list_movies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List movie was successfully destroyed"
  end
end
