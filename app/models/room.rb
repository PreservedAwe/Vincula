class Room < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'
    has_many :messages

    scope :between, -> (sender_id, recipient_id) do
        where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
            sender_id, recipient_id, recipient_id, sender_id)
    end    

    scope :total, -> (current_user_id) do
        where("(sender_id = ?) OR (recipient_id = ?)",
        current_user_id, current_user_id)
    end  
end
