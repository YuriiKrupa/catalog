class ItemsController < ApplicationController

	before_action :authenticate_user!, except: [ :index, :show]
	before_action :set_item, only: [ :show, :edit, :update, :destroy]

	def index
		@items = Item.all
			end

	def show
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		unless @item.save
			render :new
		else
			redirect_to @item
		end
	end

	def edit
	end

	def update
		if @item.update_attributes(item_params)
			redirect_to @item
		else
			render :edit
		end
	end

	def destroy
		@item.destroy
		redirect_to items_path
	end

	private

	def set_item
		@item = Item.find(params[:id])	
	end

	def item_params
		params.require(:item).permit(:title, :description, :price, :image)		
	end

end
