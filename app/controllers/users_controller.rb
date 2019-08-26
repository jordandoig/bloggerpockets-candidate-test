# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.published
    @drafts = @user.posts - @posts # drafts are unpublished posts

    @comments = @user.comments.published
    @comment_drafts = @user.comments - @comments

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
