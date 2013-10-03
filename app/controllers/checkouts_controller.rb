class CheckoutsController < ApplicationController
  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkouts }
    end
  end

  # GET
  def new_tool_checkout
    @checkout = Checkout.new
    
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @checkouts }
    end
  end
  
  #declare error classes
  class ToolNotExist < Exception
  end
  class ParticipantNotExist < Exception
  end
  
  # POST
  def create_tool_checkout
    @checkout = Checkout.new(params[:checkout])
    @checkout.checked_out_at = Date.today

    @tool = Tool.find_by_barcode(@checkout.tool_id)
    raise ToolDoesNotExist unless !@tool.nil?
    
    #do app logic validation here where the participant id field can map to different organizations.
    #this could be cool for having a student id number represent an organization and instead of participant_id we will change it to an organization_id
    @participant = Participant.find_by_card(@checkout.participant_id) #this creates a CMU directory request to get the andrew id associated with the card number. Then finds the local DB mapping to get the participant id.
    raise ParticipantDoesNotExist unless @participant.nil?

    @checkout.tool_id = @tool.id
    @checkout.participant_id = @participant.id

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /checkouts/new
  # GET /checkouts/new.json
  def new
    @checkout = Checkout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /checkouts/1/edit
  def edit
    @checkout = Checkout.find(params[:id])
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(params[:checkout])
    @checkout.checked_out_at = Date.today
    
    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checkouts/1
  # PUT /checkouts/1.json
  def update
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      if @checkout.update_attributes(params[:checkout])
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url }
      format.json { head :no_content }
    end
  end
end
