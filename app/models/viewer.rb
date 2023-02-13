class Viewer < ApplicationRecord
   
    
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true, length: {in: 2..12}
    validates :last_name, presence: true, length: {in: 2..25}


    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) #at least 8 characters long
        (?=.*\d) #contains at lease one digit
        (?=.*[a-z]) #contains at least one lowercase letter
        (?=.*[A-Z]) #contains at least one uppercase letter 
        (?=.*[[:^alnum:]]) #contains at least one symbol
    /x
    # validates :password, format: PASSWORD_REQUIREMENTS
    validates :password_digest, presence: true, 
        format: PASSWORD_REQUIREMENTS    

end