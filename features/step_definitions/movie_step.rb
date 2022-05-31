Dado("que {string} é um novo filme") do |movie_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movie_code]
  Database.new.delete_movie(@movie["title"])
end

Dado("este filme já existe no catálogo") do
  Database.new.insert_movie(@movie)
end

Quando("eu faço o cadastrado deste filme") do
  @movies_page.add
  @movies_page.form.create(@movie)
end

Então("devo ver o novo filme na lista") do
  result = @movies_page.movie_tr(@movie["title"])
  expect(result).to have_text @movie["title"]
  expect(result).to have_text @movie["status"]
end

Então("devo ver a notificação {string}") do |expect_alert|
  expect(@movies_page.form.alert).to eql expect_alert
end

Dado("que {string} está no catálogo") do |movie_code|
  steps %(
    Dado que "#{movie_code}" é um novo filme
    E este filme já existe no catálogo 
  )
end

Quando("eu solicito a exclusão") do
  @movies_page.remove(@movie["title"])
end

Quando("eu confirmo a solicitação") do
  @movies_page.sweet_alert.confirm
end

Então("este item deve ser removido do catálogo") do
  expect(@movies_page.has_no_movie(@movie["title"])).to be true
end

Quando("cancelo a solicitação") do
  @movies_page.sweet_alert.cancel
end

Então("este item deve permanecer no catálogo") do
  expect(@movies_page.has_movie(@movie["title"])).to be true
end
