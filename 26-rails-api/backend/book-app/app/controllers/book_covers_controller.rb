class BookCoversController < ApplicationController

    def index
        @books = BookCover.all 
        render json: @books, status: :ok
    end

    def show
        @book = BookCover.find(params[:id])
        render json: @book, status: :ok 
    end

    def create
        @book = BookCover.new(book_cover_params)
        if @book.save
            render json: @book, status: :created
        else
            render json: {errors: @book.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @book = BookCover.find(params[:id])
        @book.destroy
        render json: {success: "removed"}, status: :destroy
    end 

    private 
    def book_cover_params
        params.permit(:title, :author, :cover_url)
    end

end