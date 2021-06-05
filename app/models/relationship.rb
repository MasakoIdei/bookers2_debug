class Relationship < ApplicationRecord
    #followモデルは存在しないので、userモデルにbelongs_to
    belongs_to :follower, class_name:"User"
    #followedモデルは存在しないので、userモデルにbelongs_to
    belongs_to :followed, class_name:"User"
end
