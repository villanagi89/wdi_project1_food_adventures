class AdventuresController < ApplicationController
  def new
    @journal = Journal.find(params[:journal_id])
    @adventure = @journal.adventures.new
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def create
    @journal = Journal.find(params[:journal_id])
    @adventure = @journal.adventures.new(adventure_params)

    if @adventure.save
      redirect_to journal_path(@journal)
    else
    render :new
    end
  end

  def update
    @journal = Journal.find(params[:journal_id])
    @adventure = @journal.adventures.find(params[:id])

    if @adventure.update_attributes(adventure_params)
      redirect_to journal_path(@journal)
    else
      render :edit
    end
  end


  private
  def adventure_params
    params.require(:adventure).permit(:name, :address, :phone, :meal_description)

  end
end
