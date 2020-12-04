class IceCream < ActiveRecord::Base
    belongs_to :user
    validates :flavor, :toppings, :rating, presence: true
end