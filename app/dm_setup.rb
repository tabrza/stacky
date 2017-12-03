require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/comment'
require_relative 'models/interest'
require_relative 'models/follower'
require_relative 'models/like'
require_relative 'models/marked_solution'
require_relative 'models/post'
require_relative 'models/tag'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/stack_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
