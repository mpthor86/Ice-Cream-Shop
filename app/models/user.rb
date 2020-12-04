class User < ActiveRecord::Base
    has_many :ice_creams
    has_secure_password
end