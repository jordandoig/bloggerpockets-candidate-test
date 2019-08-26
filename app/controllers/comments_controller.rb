class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.published
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create({
      user: User.all.sample,
      body: params[:comment][:body],
      published: true
    })
    @comments = @post.comments.published
    render action: "index"
  end
end