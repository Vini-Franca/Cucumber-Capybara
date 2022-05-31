class MoviePage
  include Capybara::DSL

  def initialize
    @movie_list_css = "table tbody tr"
  end

  def form
    MovieAdd.new
  end

  def sweet_alert
    SweetAlert.new
  end

  def add
    find(".movie-add").click
  end

  def movie_tr(title)
    find(@movie_list_css, text: title)
  end

  def remove(title)
    visit "/"
    find("#emailId").set "tony@stark.com"
    find("#passId").set "123456"
    find(".btn").click
    movie_tr(title).find(".btn-trash").click
  end

  def has_no_movie(title)
    page.has_no_css?(@movie_list_css, text: title)
  end

  def has_movie(title)
    page.has_css?(@movie_list_css, text: title)
  end
end
