class ShiftParticipantsController < ApplicationController
  load_and_authorize_resource
  
  # GET /shift_participants
  # GET /shift_participants.json
  def index
    @shift_participants = ShiftParticipant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shift_participants }
    end
  end

  # GET /shift_participants/1
  # GET /shift_participants/1.json
  def show
    @shift_participant = ShiftParticipant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shift_participant }
    end
  end

  # GET /shift_participants/new
  # GET /shift_participants/new.json
  def new
    @shift_participant = ShiftParticipant.new(params[:shift])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shift_participant }
    end
  end

  # GET /shift_participants/1/edit
  def edit
    @shift_participant = ShiftParticipant.find(params[:id])
  end

  # POST /shift_participants
  # POST /shift_participants.json
  def create
    @shift_participant = ShiftParticipant.new(params[:shift_participant])

    respond_to do |format|
      if @shift_participant.save
        format.html { redirect_to @shift_participant, notice: 'Shift participant was successfully created.' }
        format.json { render json: @shift_participant, status: :created, location: @shift_participant }
      else
        format.html { render action: "new" }
        format.json { render json: @shift_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shift_participants/1
  # PUT /shift_participants/1.json
  def update
    @shift_participant = ShiftParticipant.find(params[:id])

    respond_to do |format|
      if @shift_participant.update_attributes(params[:shift_participant])
        format.html { redirect_to @shift_participant, notice: 'Shift participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shift_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_participants/1
  # DELETE /shift_participants/1.json
  def destroy
    @shift_participant = ShiftParticipant.find(params[:id])
    @shift_participant.destroy

    respond_to do |format|
      format.html { redirect_to shift_participants_url }
      format.json { head :no_content }
    end
  end


  def clock_out
    @shift_participant = ShiftParticipant.find(params[:id])

    if(!@shift_participant.nil? && @shift_participant.clocked_out_at.nil?)
        @shift_participant.clocked_out_at = Date.today
        @shift_participant.save!

        redirect_to @shift_participant.shift
    else
        flash[:notice] = "#{@shift_participant.participant.name} was not clocked out."
        redirect_to @shift_participant.shift
    end
  end

  def clock_in
    @shift = Shift.find(params[:id])

    @shift_participant = ShiftParticipant.new
    @shift_participant.shift = @shift
    shift = @shift


    # @shift_participant.participant_id = Participant.find_by_card(params[:participant]).id

    # @shift_participant.save!

    # if(!@shift.is_checked_out?)
    #     @checkout = Checkout.new
    #     @checkout.checked_in_at = nil
    #     @checkout.checked_out_at = Date.today
    #     @checkout.tool = @tool
    #     @checkout.participant = nil
    #     @checkout.organization = nil
    #     @checkout.save!

    #     redirect_to @tool
    # else
    #     flash[:notice] = "#{@tool.name} was not checked out because it has been previously checked out."
    #     redirect_to @tool
    # end
  end
end
