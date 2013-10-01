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
    @shift_participant = ShiftParticipant.new

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
end
