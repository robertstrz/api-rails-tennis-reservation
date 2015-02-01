class User < ActiveRecord::Base
	has_many :articles
	#before_save :some_function
	before_validation :ensure_login_has_a_value, :some_function
	validates :name, presence: true, length: {maximum:50}
	validates :email, presence: true, length: {maximum:250}
  	validates :access_token, presence: true, uniqueness: true
	has_secure_password

	
 
  protected
    def ensure_login_has_a_value
      if email.blank?
        self.email = "afafa"
        #self.access_token = SecureRandom.hex
      end
    end

   protected
    def some_function
    	if access_token.blank?
      		self.access_token = SecureRandom.hex
      		p "Before create"
      	end
    end

end
