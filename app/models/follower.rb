class Follower
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
end
