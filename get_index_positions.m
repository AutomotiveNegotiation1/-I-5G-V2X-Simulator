       function [index_position_mod, index_position_interf_mod] = get_index_positions(t,interfering_eNodeB_ids,ff_trace,starting_point,interfering_starting_points)
           t_step  = 1e-3; 
           trace_length_samples = ff_trace.trace_length_s / 1e-3;
           % Index for the target channel
           index_position            = floor(t/t_step);
           index_position_plus_start = index_position + starting_point;
           index_position_mod        = (mod(index_position_plus_start,trace_length_samples))+1;
           
           % Get the indexes for the interfering channels
           if ~isempty(interfering_eNodeB_ids)
               index_position_plus_start_interf = index_position + interfering_starting_points(interfering_eNodeB_ids);
               index_position_interf_mod        = (mod(index_position_plus_start_interf,trace_length_samples))+1;
           else
               index_position_interf_mod        = [];
           end
       end