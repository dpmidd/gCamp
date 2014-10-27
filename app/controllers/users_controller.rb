class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]


    def set_user
      @user = User.find(params[:id])
    end

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(params.require(:user).permit(:first_name, :last_name, :email_address))
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'Task was successfully created.'}
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
    end

end
