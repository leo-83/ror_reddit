class Sub < ApplicationRecord
    has_many :topics, dependent: :destroy
    vadidates :title, presence: true
    validates :title, uniqueness: true

end
