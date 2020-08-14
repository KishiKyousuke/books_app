class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:update, :destroy, :edit]

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.author = current_user.name

    if @comment.save!
      redirect_to @commentable, notice: t("view.common.flash.create")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@commentable, @comment], notice: t("view.common.flash.update")
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t("view.common.flash.destroy")
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_commentable
      resource, id = request.path.split("/")[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
