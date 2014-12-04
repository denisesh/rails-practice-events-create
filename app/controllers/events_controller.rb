class EventsController < ApplicationController
  def index
   @events = Event.all
  end

#add show here

  def new
   @event = Event.new
  end

# check for pluralization of @eventS. this fucks you up a lot!!!!
  def edit
   @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
      if @event.save
        redirect_to :new_event
      else
        render :new
      end
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to events_path
      else
        render :edit
      end
  end
# delete events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end



  private

    def event_params
      params.require(:event).permit(
      :date,
      :description,
      :requires_id,
      :capacity,
      :directions,
      )
    end



end
