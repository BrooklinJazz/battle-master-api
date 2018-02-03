class CombatsController < ApplicationController
  before_action :set_combat, only: [:show, :edit, :update, :destroy]

  # GET /combats
  # GET /combats.json
  def index
    @combats = Combat.all
  end

  # GET /combats/1
  # GET /combats/1.json
  def show
  end

  # GET /combats/new
  def new
    @combat = Combat.new
  end

  # GET /combats/1/edit
  def edit
  end

  # POST /combats
  # POST /combats.json
  def create
    @combat = Combat.new(combat_params)

    respond_to do |format|
      if @combat.save
        format.html { redirect_to @combat, notice: 'Combat was successfully created.' }
        format.json { render :show, status: :created, location: @combat }
      else
        format.html { render :new }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combats/1
  # PATCH/PUT /combats/1.json
  def update
    respond_to do |format|
      if @combat.update(combat_params)
        format.html { redirect_to @combat, notice: 'Combat was successfully updated.' }
        format.json { render :show, status: :ok, location: @combat }
      else
        format.html { render :edit }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combats/1
  # DELETE /combats/1.json
  def destroy
    @combat.destroy
    respond_to do |format|
      format.html { redirect_to combats_url, notice: 'Combat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combat
      @combat = Combat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combat_params
      params.require(:combat).permit(:name, :fight, :user_id)
    end
end
