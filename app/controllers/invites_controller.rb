class InvitesController < ApplicationController

    def create_colabs
        colabs = params[:colaborators]
        colabs.each do |u|
            Invite.create(
                event_id: params[:event_id], #
                user_id: u,
            )
        end
    end
    
end
