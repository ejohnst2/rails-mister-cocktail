class DosesController < ApplicationController

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
     @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @doses = @cocktail.doses
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
