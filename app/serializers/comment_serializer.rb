class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :date_of_comment, :created_at, :updated_at
  belongs_to :article
end
