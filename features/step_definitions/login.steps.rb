Quando('eu faço login com {string} e {string}') do |email, password|
    @login = LoginPage.new
    @login.go
    @login.with(email,password)
  end
  
  Então('devo ser autenticado') do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    sleep 0.5
    token = page.execute_script(js_script)
    expect(token.length).to be 147
    sleep 2

  end
  
  Então('devo ver {string} na área logada') do |expect_name|
    @sidebar = SideBarView.new
    expect(@sidebar.logged_user).to eql expect_name
  end
  
  Então('não devo ser autenticado') do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    sleep 0.5
    token = page.execute_script(js_script)
    expect(token).to be nil
  end
  
  Então('devo ver a mensagem de alerta {string}') do |expect_message|
    @login = LoginPage.new
    expect(@login.alert).to eql expect_message
  end