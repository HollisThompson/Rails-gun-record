class GunController < ApplicationController

    def index
        @guns = Gun.all
        render :index
    end

    def new
        @gun = Gun.new
        render :new
    end

    def edit
        @gun = Gun.find(params[:id])
        render :edit
    end

    def create
        @gun = Gun.new(gun_params)
        if @gun.save
            redirect_to gun_url(@gun)
        else
            redirect_to new_gun_url
        end
    end

    def show 
        @gun = Gun.find(params[:id])
        render :show
    end
    
    def update 
        @gun = Gun.find(params[:id])
        if @gun.update(gun_params)
            redirect_to gun_url(@gun)
        else
            flash.now[:errors] = @gun.errors.full_messages
            render :edit
        end
    end

    def destroy
        @gun = Gun.find(params[:id])
        @gun.destroy
        redirect_to gun_index_url
    end

    private

    def gun_params
        params.require(:gun).permit(:condition ,:year ,:model)
    end

end
