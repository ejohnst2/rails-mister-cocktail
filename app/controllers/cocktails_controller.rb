class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end


end


  # --

  # def index
  #   @cocktails = Cocktail.all
  # end

  # def new
  #   @cocktail = Cocktail.new
  # end

  # def create
  #    @cocktail = Cocktail.new(cocktail_params)

  #   respond_to do |format|
  #     if @cocktail.save
  #       format.html { redirect_to @cocktail, notice: 'cocktail was successfully created.' }
  #       format.json { render :show, status: :created, location: @cocktail }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cocktail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # def update
  #   respond_to do |format|
  #     if @cocktail.update(cocktail_params)
  #       format.html { redirect_to @cocktail, notice: 'cocktail was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cocktail }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cocktail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @cocktail.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cocktails_url, notice: 'cocktail was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # def edit
  # end

  # def show
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  # def cocktail_params
  #   params.require(:cocktail).permit(:name, :photo)
  # end
