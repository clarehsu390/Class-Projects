class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end

 def edit
   @cat = selected_cat
   render :edit
 end

 def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 400
    end
  end

  def show
    @cat = selected_cat
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name,:birth_date,:description,:color,:gender)
  end

  def selected_cat
    Cat.find_by(id: params[:id])
  end
end
