class BlogsController < ApplicationController

  include SessionsHelper

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  before_action :is_logged_in?, only: [:new, :create, :update, :destroy]

  def index
    @blogs = Blog.all.page(params[:page])
  end

  def show
    @edit_blog = session[:user_id].present?
    @delete_blog = session[:user_id].present?
  end

  def new
    @blog = Blog.new(params[:blog])
  end

  def create
    #uses the blog params make blog instance
    @blog = Blog.new(blog_params)
    respond_to do |format|
      #if blog can be saved then:
      if @blog.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to blog_path(@blog), notice: 'Your blog entry was successfully published.' }
      else
        #otherwise go back to new action
        format.html { render :new }
      end

    end

  end

def update
  respond_to do |format|


    if @blog.update(blog_params)
      # In this format call, the flash message is being passed directly to
      # redirect_to().  It's a caonvenient way of setting a flash notice or
      # alert without referencing the flash Hash explicitly.
      format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
    else
      format.html { render :edit }
    end

  end

end


  def destroy
    #deletes the recipe instance
    @blog.destroy!
    redirect_to blogs_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(
                                  :title,
                                  :abstract,
                                  :body,
                                  :image
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

end
