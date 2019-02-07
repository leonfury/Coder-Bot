class MidpointsController < ApplicationController
    def create

        midpoint = Midpoint.new(midpoint_params)
        if midpoint.save 
            p 'user info save'
            redirect_to admin_index_path, notice: "New Meeting Point Created"
        else
            p 'failed to save listing'
            p midpoint.errors.full_messages
            redirect_to admin_index_path, notice: "Error"
        end
        
    end

    private
    def midpoint_params
        params.require(:midpoint).permit(
            :name,
            :address,
            :description,
            :longtitude,
            :latitude,
            :poi,
            :category,
        )
    end

end
