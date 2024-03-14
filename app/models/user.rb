class User < ApplicationRecord
    has_one :setting, dependent: :destroy
    has_many :conversations, dependent: :destroy
    has_many :messages, dependent: :destroy

end
