class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def show
    @journal = Journal.find(params[:id])
    @adventure = @journal.adventures
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

  def edit
    @journal = Journal.find(params[:id])

  end

  def update
    @journal = Journal.find(params[:id])

    if @journal.update(journal_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    flash[:success] = 'Journal successfully deleted'
    redirect_to action: :index
  end


  private
    def journal_params
      params.require(:journal).permit(:event_title, :event_date).merge(user_id: current_user.id)
    end
end
