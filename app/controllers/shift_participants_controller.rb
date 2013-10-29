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

  def new_shift_clock_in
    @shift_participant = ShiftParticipant.new
    @shift = Shift.find(params[:id])
    @shift_participant.shift = @shift

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shift_participants }
    end
  end

  def new_shift_clock_out
    @shift_participant = ShiftParticipant.find(params[:id])

    @shift = @shift_participant.shift
    @participant = @shift_participant.participant

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shift_participants }
    end
  end

  # POST
  def create_shift_clock_in
    @shift_participant = ShiftParticipant.new
    @shift_participant.clocked_in_at = Date.today
    @shift = Shift.find_by_id(params[:shift_participant][:shift_id])
    raise ShiftDoesNotExist unless !@shift.nil?

    #do app logic validation here where the participant id field can map to different organizations.
        #this could be cool for having a student id number represent an organization and instead of participant_id we will change it to an organization_id
        @participant = Participant.find_by_card(params[:shift_participant][:temp_id_card_number].to_s) #this creates a CMU directory request to get the andrew id associated with the card number. Then finds the local DB mapping to get the participant id.
        raise ParticipantDoesNotExist unless !@participant.nil?

      @shift_participant.shift_id = @shift.id
      @shift_participant.participant_id = @participant.id

      respond_to do |format|
        if @shift_participant.save
          format.html { redirect_to @shift, notice: "#{@participant.name} was successfully checked in." }
          format.json { render json: @shift, status: :created, location: @shift }
        else
          format.html { render action: "new" }
          format.json { render json: @shift_participant.errors, status: :unprocessable_entity }
        end
      end
    end

    def create_shift_clock_out
      @shift_participant = ShiftParticipant.find(params[:shift_participant][:id])
      @shift_participant.clocked_out_at = Date.today

      #do app logic validation here where the participant id field can map to different organizations.
          #this could be cool for having a student id number represent an organization and instead of participant_id we will change it to an organization_id
          @participant = Participant.find_by_card(params[:shift_participant][:temp_id_card_number].to_s) #this creates a CMU directory request to get the andrew id associated with the card number. Then finds the local DB mapping to get the participant id.
          raise ParticipantDoesNotExist unless !@participant.nil?

          # puts @participant.name != Participant.find_by_id(@shift_participant.participant).name

        if(@participant.name != Participant.find_by_id(@shift_participant.participant).name)
          raise "Participant does not match"
        end

        respond_to do |format|
          if @shift_participant.save!
            format.html { redirect_to @shift_participant.shift, notice: "#{@participant.name} was successfully checked out." }
            format.json { render json: @shift_participant.shift, status: :created, location: @shift }
          else
            format.html { render action: "new" }
            format.json { render json: @shift_participant.errors, status: :unprocessable_entity }
          end
        end
      end


      # def new_shift_clock_out


      #   if(!@shift_participant.nil? && @shift_participant.clocked_out_at.nil?)
      #       @shift_participant.clocked_out_at = Date.today
      #       @shift_participant.save!

      #       redirect_to @shift_participant.shift
      #   else
      #       flash[:notice] = "#{@shift_participant.participant.name} was not clocked out."
      #       redirect_to @shift_participant.shift
      #   end
      # end

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