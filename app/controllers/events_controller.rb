class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def create
        event = Event.new(event_params)
        event.user = current_user
        event.midpoint = Midpoint.first
        
        if event.save 
            flash[:success] = "SUCCESS >>> New Event Created Sucessfully"
        else
            flash[:error] = "ERROR >>> Event Creation Fail #{event.errors.full_messages}"
        end
        redirect_to root_path
    end

    def show
        @event = Event.find(params[:id])
        @colabs = @event.invites
    end

    def event_remote
        redirect_to event_path(current_user.events.last.id)
    end

    private
    def event_params
        params.require(:event).permit(
          :user_id, 
          :midpoint_id, 
          :remark, 
          :event_date,
          :event_time,
        )
    end
end
