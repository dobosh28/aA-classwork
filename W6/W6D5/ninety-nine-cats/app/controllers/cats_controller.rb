class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(cat_params)
        render :create
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def show 
        @cat = Cat.find(params[:id])
        render :show
    end

    def update
        @cat = Cat.find(params[:id])
        render @cat
    end




    private 

    def cat_params
        params.require(:cats).permit(:name, :color, :sex, :age, :birth_date, :description)
    end
end