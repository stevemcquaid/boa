class DiagramsController < ApplicationController
  def edit
    @diagram = Diagram.find(params[:id])
  end

  def show
    @diagram = Diagram.find(params[:id])
  end

  def index
    @diagrams = Diagram.all
  end

  def new
    @diagram = Diagram.new
  end


  def create
    @diagram = Diagram.new(params[:diagram])

    if @diagram.save
      flash[:notice] = "#{@diagram.id} has been created."
      redirect_to @diagram 
    else
      render :action => 'new'
    end
  end

  def update
    @diagram = Diagram.find(params[:id])

    if @diagram.update_attributes(params[:diagram])
      flash[:notice] = "#{@diagram.id} is updated."
      redirect_to @diagram
    else
      render :action => 'edit'
    end
  end

  def destroy
    @diagram = Diagram.find(params[:id])
    @diagram.destroy

    flash[:notice] = "Successfully removed #{@diagram.id} from BOA."
    redirect_to diagram_url
  end
end
