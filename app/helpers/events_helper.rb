module EventsHelper
    def s_d(arr)
        stats = DescriptiveStatistics::Stats.new(arr)
        stats.standard_deviation
    end

    def eval_lower(arr)
        initial_s_d = s_d(arr)
        rem_el = arr.shift

        if s_d(arr) > initial_s_d
            arr.unshift(rem_el)
        end 
        arr
    end

    def eval_upper(arr)
        initial_s_d = s_d(arr)
        rem_el = arr.pop

        if s_d(arr) > initial_s_d
            arr.push(rem_el)
        end 
        arr
    end


end
