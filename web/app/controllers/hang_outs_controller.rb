require 'net/http'
require 'json'
class HangOutsController < ApplicationController
  before_action :set_hang_out, only: [:show, :edit, :update, :destroy]

  # GET /hang_outs
  # GET /hang_outs.json
  def index
    @hang_outs = HangOut.all
  end

  def get_json
    uri = URI.parse("http://recommend:5000")
    text = Net::HTTP.get(uri)
    @result = text
  end

  # GET /hang_outs/1
  # GET /hang_outs/1.json
  def show
    @like = Like.new
    @comments = @hang_out.comments
    @comment = current_user.comments.new
  end

  # GET /hang_outs/new
  def new
    @hang_out = HangOut.new
  end

  # GET /hang_outs/1/edit
  def edit
  end

  # POST /hang_outs
  # POST /hang_outs.json
  def create
    @hang_out = HangOut.new(hang_out_params)
    @hang_out.user_id = current_user.id
    @hang_out.save

    # respond_to do |format|
    #   if @hang_out.save
    #     format.html { redirect_to @hang_out, notice: 'Hang out was successfully created.' }
    #     format.json { render :show, status: :created, location: @hang_out }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @hang_out.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to "http://localhost:3000/user/#{current_user.id}"
  end

  # PATCH/PUT /hang_outs/1
  # PATCH/PUT /hang_outs/1.json
  def update
    respond_to do |format|
      if @hang_out.update(hang_out_params)
        format.html { redirect_to @hang_out, notice: 'Hang out was successfully updated.' }
        format.json { render :show, status: :ok, location: @hang_out }
      else
        format.html { render :edit }
        format.json { render json: @hang_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hang_outs/1
  # DELETE /hang_outs/1.json
  def destroy
    @hang_out.destroy
    respond_to do |format|
      format.html { redirect_to hang_outs_url, notice: 'Hang out was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hang_out
      @hang_out = HangOut.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hang_out_params
      params.require(:hang_out).permit(:name, :date, :start_time, :end_time, :user_id)
    end
end
