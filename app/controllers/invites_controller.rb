class InvitesController < ApplicationController

    def create_colabs
        colabs = params[:colaborators]
        colabs.each do |u|
            Invite.create(
                event: current_user.events.last,
                user_id: u,
            )
        end
    end



end
