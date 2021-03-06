class Post
  include DataMapper::Resource

  property :id, Serial
  property :maker, String
  property :body, Text
  property :created_at, DateTime

  has n,   :tags

  belongs_to :user
  belongs_to :interest, :required => false
end
