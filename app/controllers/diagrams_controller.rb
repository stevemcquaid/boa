class DiagramsController < ApplicationController
  load_and_authorize_resource

  require 'rubygems'
  require 'pdf/reader'


  def index
    @diagrams = Diagram.all
  end

  def show
    @diagram = Diagram.find(params[:id])
    
    @diagram_url_path = @diagram.image.to_s
  end

  def new
    @diagram = Diagram.new
  end

  def edit
    @diagram = Diagram.find(params[:id])
  end


  def create
    @diagram = Diagram.new(params[:diagram])

    if @diagram.save
      flash[:notice] = "#{@diagram.name} has been created."
      redirect_to @diagram
    else
      render :action => 'new'
    end
  end

  def update
    @diagram = Diagram.find(params[:id])

    if @diagram.update_attributes(params[:diagram])
      flash[:notice] = "#{@diagram.name} was updated."
      redirect_to @diagram
    else
      render :action => 'edit'
    end
  end

  def destroy
    @diagram = Diagram.find(params[:id])
    @diagram.destroy

    flash[:notice] = "Successfully removed #{@diagram.name} from BOA."
    redirect_to diagrams_url
  end
end