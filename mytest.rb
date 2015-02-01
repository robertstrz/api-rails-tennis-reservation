class MyTest

    def authenticate_test
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      User.exists?(email: "myddmail")
      p "authentdsfdficate"

    end

    def render_unauthorized
      User.exists?(email: "myemail")
      p "asdfasdfasdf"
    end
end
