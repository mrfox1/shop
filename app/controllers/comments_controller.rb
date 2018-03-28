class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_url, notice: 'Comment was successfully created.' }
        format.js { }
      end
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
