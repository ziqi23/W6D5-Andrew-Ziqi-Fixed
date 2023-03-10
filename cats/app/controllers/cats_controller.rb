class CatsController < ApplicationController
    def index
        @all_cats = Cat.all
        render :index
    end

    def create
    end

    def new
        render :new
    end

    def edit
    end

    def show
        @cat_found =  Cat.find_by(id: params[:id])
        render :show
        
    end

    def update
    end

    private
    def cat_params
    end

end
