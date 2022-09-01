class Sub < ApplicationRecord

    vadidates :title, presence: true
    validates :title, uniqueness: true

end
