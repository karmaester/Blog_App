class SectionsController < ApplicationController
    def index
        @sections = Section.all.order('created_at DESC')
    end

    def edit
        @section = Section.find(params[:id])
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

    def update
        @section = Section.find(params[:id])
        if @section.update_attributes(section_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @section
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
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