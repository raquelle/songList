class Api::ListsController < ApplicationController
    def index
        render json: List.all
    end

    def create
        list = List.new(list_params)
        if list.save
            render json: item
        else 
            render json: {errors: item.errors}, status: :unprocessable_entity
        end
    end

    def update
        list = List.find(params[:id])
        list.update(complete: !list.complete)
        render json: list
    end

    def destroy
        List.find(params[:id]).destroy
        render json: { message: 'List deleted' }
    end

    private

    def list_params
        params.require(:list).permit()
    end

end
