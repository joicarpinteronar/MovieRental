class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  # GET /rentals
  # GET /rentals.json
  def index
    if params[:client_id]
      @client = Client.find_by(id: params[:client_id])
      if @client.nil?
        redirect_to "/"
      else
        @checked_out = @client.rentals.checked_out
        @past_rentals = @client.rentals.past_rentals
      end
    else
      redirect_to "/"
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.create(
        :client_id => params[:client_id],
        :movie_id => params[:movie_id]
      )
  @message = @rental.rent_movie
  redirect_to client_rentals_path(@rental.client), :notice => @message
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    @rental = Rental.find_by(id: params[:rental_id])
    @rental.update(:status => "Stock")
    @rental.save

    @message = "Sillas Completas #{@rental.movie.title}."
    redirect_to client_rentals_path(@rental.client), :notice => @message
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:client_id, :movie_id, :status)
    end
end
