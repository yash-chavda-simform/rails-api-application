class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :release_date, :created_at, :updated_at
  has_many :comments, dependent: :destroy
end
