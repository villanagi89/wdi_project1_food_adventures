class AdventuresController < ApplicationController
  def show
    @journal = Journal.find(params[:journal_id])
    @adventure = @journal.adventures.find(params[:id])
  end

end
