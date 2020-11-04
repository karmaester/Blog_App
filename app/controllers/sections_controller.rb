class SectionsController < ApplicationController
    def index
    end

    def new
        @section = Section.new
    end

    def create
        @section = Section.new(section_params)
        if @section.save
            redirect @section
        else
            render 'new'
        end
    end

    def show
    end

    private

    def section_params
        params.require(:post).permit(:name, :date)
    end
end
