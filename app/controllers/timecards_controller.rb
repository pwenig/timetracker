class TimecardsController < ApplicationController
  before_action :set_timecard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  # GET /timecards
  # GET /timecards.json
  def index
    @timecards = Timecard.all
  end

  # GET /timecards/1
  # GET /timecards/1.json
  def show
  end

  # GET /timecards/new
  def new
    @timecard = Timecard.new
  end

  # GET /timecards/1/edit
  def edit
  end

  # POST /timecards
  # POST /timecards.json
  def create
    @timecard = Timecard.new(timecard_params)
    @timecard.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @timecard.save
        format.html { redirect_to @timecard, notice: 'Timecard was successfully created.' }
        format.json { render :show, status: :created, location: @timecard }
      else
        format.html { render :new }
        format.json { render json: @timecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timecards/1
  # PATCH/PUT /timecards/1.json
  def update

    # Add method to calc hours for period
    # def time_diff(start_time, end_time)
    #   seconds_diff = (start_time - end_time).to_i.abs
    
    #   hours = seconds_diff / 3600
    #   seconds_diff -= hours * 3600
    
    #   minutes = seconds_diff / 60
    #   seconds_diff -= minutes * 60
    
    #   seconds = seconds_diff
    
    #   "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    # end

    
    respond_to do |format|
      if @timecard.update(timecard_params)
        format.html { redirect_to @timecard, notice: 'Timecard was successfully updated.' }
        format.json { render :show, status: :ok, location: @timecard }
      else
        format.html { render :edit }
        format.json { render json: @timecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timecards/1
  # DELETE /timecards/1.json
  def destroy
    @timecard.destroy
    respond_to do |format|
      format.html { redirect_to timecards_url, notice: 'Timecard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timecard
      @timecard = Timecard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timecard_params
      params.require(:timecard).permit(:time_in, :time_out, :tasks, :notes)
    end
end
