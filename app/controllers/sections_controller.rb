class SectionsController < ApplicationController
    def index
        @sections = Section.all.order('created_at DESC')
    end

    def new
        @section = Section.new
    end

    def create
        @section = Section.new(section_params)
        
        if @section.save
            render 'show'
        else
            render 'new'
        end

    end

    def show
        @section = Section.find(params[:id])
    end

    def destroy
        @section = Section.find(params[:id])
        if @section.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to sections_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to sections_path
        end
    end
    

    private

    def section_params
        params.require(:section).permit(:name, :content)
    end
end