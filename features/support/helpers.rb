module Helpers
    def get_token
        js_script = 'return window.localStorage.getItem("default_auth_token");'
        sleep 0.5
        page.execute_script(js_script)
    end

end