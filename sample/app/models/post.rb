class Post < ActiveRecord::Base
include ActiveModel::ForbiddenAttributesProtection
end
