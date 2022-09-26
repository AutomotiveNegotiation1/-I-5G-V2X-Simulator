function VUE_layout = move_VUEs(VUE_layout,roi_x,roi_y,ISD,current_TTI,UEs,distance,line_width,TTI_MAX)
some_UE_out_of_ROI_this_TTI = false;
% num_of_LTE_R_UEs=1;
 simulation_time_tti=TTI_MAX;
 for i= 1:size (distance,1)
    
 distance_to_PS_LTE_eNodeB(i) = distance(i);
 TTI_resolution = 10;
x_range = [ roi_x(1) roi_x(2) ];
y_range = [ roi_y(1) roi_y(2) ];
% y_range=ISD/sqrt(3.0).*[-1,1]; 
distance_resolution=2*y_range(2)/(simulation_time_tti/TTI_resolution);
handover_requested = 0;

for z = 1:size(VUE_layout,1)

new_pos(z,1:2) = move_ue(VUE_layout(z,1:2),UEs(z).walking_model);
VUE_layout(z,1:2) = new_pos(z, 1:2);
update_UE_pos(z)=~mod(current_TTI,TTI_resolution);
ROI_teleport       = ~is_in_roi(new_pos(z,1:2),x_range,y_range);

    if ROI_teleport || handover_requested ||update_UE_pos(z)
        if ROI_teleport  
            
            x_init=distance_to_PS_LTE_eNodeB(i)+line_width/2;
            new_UE_position = [x_init, y_range(1)+0.01];
            % Teleport UE
            VUE_layout(z,1:2) = new_UE_position;
        elseif update_UE_pos(z)
          
            ang=UEs(z).walking_model.direction;
            new_UE_position = VUE_layout(z,1:2)+distance_resolution.*[cosd(ang),sind(ang)];
            
            % Teleport UE
            VUE_layout(z,1:2) = new_UE_position;
            
        end 
        
%         Print some debug
        if ~some_UE_out_of_ROI_this_TTI
            some_UE_out_of_ROI_this_TTI = true;
        end
    end
end
end
end