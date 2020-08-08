class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(hang_out_id: params[:hang_out_id])
    redirect_back(fallback_location: hang_outs_path)
  end

  def destroy
    @like = Like.find_by(hang_out_id: params[:hang_out_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: hang_outs_path)
  end
end
