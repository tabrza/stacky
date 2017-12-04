class Comment
  include DataMapper::Resource

  property :id, Serial
  property :maker, String
  property :body, Text
  property :created_at, DateTime

  has n, :likes

  belongs_to :user
  belongs_to :post
end
