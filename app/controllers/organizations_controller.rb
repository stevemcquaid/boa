class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organizations = Organization.find(params[:id])
  end

  def new
    @organizations = Organization.new
  end

  def edit
    @organizations = Organization.find(params[:id])
  end


  def create
    @organizations = Organization.new(params[:organization])

    if @organizations.save
      flash[:notice] = "#{@organizations.name} has been created."
      redirect_to @organizations 
    else
      render :action => 'new'
    end
  end

  def update
    @organizations = Organization.find(params[:id])

    if @organizations.update_attributes(params[:organization])
      flash[:notice] = "#{@organizations.name} was updated."
      redirect_to @organizations
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organizations = Organization.find(params[:id])
    @organizations.destroy

    flash[:notice] = "Successfully removed #{@organizations.name} from BOA."
    redirect_to organizations_url
  end
end
