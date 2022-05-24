Dado('que {string} é um novo filme') do |movie_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movie_code]
end

Quando('eu faço o cadastrado deste filme') do
 @movies_page.add
 @movies_page.create(@movie)
 
end

Então('devo ver o novo filme na lista') do
  result = @movie_page.movie_tr(@movie)
  expect(result).to have_text @movie["title"]
  expect(result). to have_text @movie["status"]
end

Então('devo ver a notificação {string}') do |expect_alert|
 expect(@movies_page.alert).to eql expect_alert
end