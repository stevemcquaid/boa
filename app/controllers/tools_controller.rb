class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def edit
    @tool = Tool.find(params[:id])
  end


  def create
    @tool = Tool.new(params[:tool])

    if @tool.save
      flash[:notice] = "#{@tool.name} has been created."
      redirect_to @tool 
    else
      render :action => 'new'
    end
  end

  def update
    @tool = Tool.find(params[:id])

    if @tool.update_attributes(params[:tool])
      flash[:notice] = "#{@tool.name} was updated."
      redirect_to @tool
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    flash[:notice] = "Successfully removed #{@tool.name} from BOA."
    redirect_to Tools_url
  end


  # User permissions need to be added to the following 2 methods
  def checkout
    @tool = Tool.find(params[:id])

    if(!@tool.is_checked_out?)
        @checkout = Checkout.new
        @checkout.checked_in_at = nil
        @checkout.checked_out_at = Date.today
        @checkout.tool = @tool
        @checkout.participant = nil
        @checkout.organization = nil
        @checkout.save!
    else
        flash[:notice] = "#{@tool.name} was not checked out because it has been previously checked out."
        redirect_to @tool
    end
  end


  def checkin
    @tool = Tool.find(params[:id])

    if(@tool.is_checked_out?)
        @checkout = @tool.checkouts.current
        @checkout.checked_in_at = Date.today
        @checkout.save!
    else
        flash[:notice] = "#{@tool.name} was not checked in because it was not checked out."
        redirect_to @tool
    end
  end
end
