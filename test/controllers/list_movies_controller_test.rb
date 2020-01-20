require 'test_helper'

class ListMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_movie = list_movies(:one)
  end

  test "should get index" do
    get list_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_list_movie_url
    assert_response :success
  end

  test "should create list_movie" do
    assert_difference('ListMovie.count') do
      post list_movies_url, params: { list_movie: {  } }
    end

    assert_redirected_to list_movie_url(ListMovie.last)
  end

  test "should show list_movie" do
    get list_movie_url(@list_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_movie_url(@list_movie)
    assert_response :success
  end

  test "should update list_movie" do
    patch list_movie_url(@list_movie), params: { list_movie: {  } }
    assert_redirected_to list_movie_url(@list_movie)
  end

  test "should destroy list_movie" do
    assert_difference('ListMovie.count', -1) do
      delete list_movie_url(@list_movie)
    end

    assert_redirected_to list_movies_url
  end
end
