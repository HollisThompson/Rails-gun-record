class GunController < ApplicationController

    before_action :authenticate_user!, only: [:new,:create,:destroy,:owned]

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
        if @gun.save!
            redirect_to gun_url(@gun)
        else
            redirect_to new_gun_url, notice: "Gun couldn't save"
        end
    end

    def show 
        @gun = Gun.find(params[:id])
        render :show
    end
    
    def update 
        @gun = Gun.find(params[:id])
        if @gun.update!(gun_params)
            redirect_to gun_url(@gun)
        else
            redirect_to :edit, notice: "Gun couldn't update"
        end
    end

    def destroy
        @gun = Gun.find(params[:id])
        @gun.destroy
        redirect_to gun_index_url
    end

    def owned
        @guns = Gun.all
        render :owned
    end

    private

    def gun_params
        params.require(:gun).permit(:condition ,:year ,:model, :user_id)
    end

end
