class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :like]
    def show
        
    end

    def new
        @post = Post.new
    end

    def edit
        
    end

    def create
        post = Post.create(post_params)
        if post.valid?
            redirect_to post_path(post)
        else
            flash[:errors_array] = post.errors.full_messages
            redirect_to new_post_path(post)
        end
    end

    def update
        
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:errors_array] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    


  

    private

    def find_post
        @post = Post.find(params[:id])
    end


    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
    


end