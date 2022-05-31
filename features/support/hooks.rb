require "report_builder"
require "date"

Before do
  @login_page = LoginPage.new
  @movies_page = MoviePage.new
  @sidebar = SideBarView.new

  #page.driver.browser.resize_to(1080,720)
end

Before("@login") do
  @login_page.go
  @login_page.with("tony@stark.com", "123456")
end

After do
  temp_shot = page.save_screenshot("log/temp_shot.png")
end

d = DateTime.now
@current_date = d.to_s.tr(":", "-")
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/" + @current_date
    config.report_types = [:html]
    config.report_title = "Ninjaflix - WebApp"
    config.additional_info = { "App" => "Web", "Data de execução" => @current_date }
    config.color = "indigo"
  end
  ReportBuilder.build_report
end
