Before do
    @login_page = LoginPage.new
    @movies_page = MoviePage.new
    @sidebar = SideBarView.new
end

Before("@login") do
    @login_page.go
    @login_page.with('tony@stark.com', '123456')
end