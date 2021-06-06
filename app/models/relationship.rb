class Relationship < ApplicationRecord
    #followモデルはこの場で作った架空のモデル
    # belongs_to :followerだけだと、followモデルが見つからないというエラーになるので
    # class_name:"User"と定義することで、Userテーブルのレコードを参照してくれる

    belongs_to :follower, class_name:"User"
    #followedモデルは存在しないので、userモデルにbelongs_to
    belongs_to :followed, class_name:"User"
end
