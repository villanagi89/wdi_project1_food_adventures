class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)

    if @journal.save
      flash[:success] = 'Journal successfully created.'
      redirect_to root_path(@journal)
    else
      render :new
    end
  end


  private
    def journal_params
      params.require(:journal).permit(:event_title, :event_date)
    end
end
