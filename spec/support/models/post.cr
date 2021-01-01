class Post < BaseModel
  skip_default_columns

  table do
    primary_key custom_id : Int64
    timestamps

    column title : String
    column published_at : Time?
    has_many comments : Comment
    has_many nice_comments : Comment,
      query: Comment::BaseQuery.new.body(Comment::NICE_COMMENT_BODY)
    has_many taggings : Tagging
    has_many tags : Tag, through: [:taggings, :tag]
    has_many funny_tags : Tag, through: [:taggings, :tag], query: Tag::BaseQuery.new.name(Tag::FUNNY_TAG_NAME)
  end
end

# This is a regular post, but with a custom table name
# This is to test that 'belongs_to' can accept a 'table' in the
# CommentForCustomPost model
class PostWithCustomTable < BaseModel
  skip_default_columns

  table :posts do
    primary_key custom_id : Int64
    timestamps

    column title : String
    column published_at : Time?
    has_many comments_for_custom_post : CommentForCustomPost, foreign_key: :post_id
  end
end
