class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        blogger = Blogger.create(blogger_params(:name, :bio, :age))
        if blogger.valid?
            redirect_to blogger_path(blogger)
        else
            flash[:errors_array] = blogger.errors.full_messages
            redirect_to new_blogger_path(blogger)
        end
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    private

    def blogger_params(*args)
        params.require(:blogger).permit(*args)
    end

end