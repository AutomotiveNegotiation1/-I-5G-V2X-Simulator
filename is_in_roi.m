        function UE_in_roi = is_in_roi(a_UE,roi_x_range,roi_y_range)
            UE_pos_x = a_UE(1);
            UE_pos_y = a_UE(2);

            if UE_pos_x<roi_x_range(1) || UE_pos_x>roi_x_range(2)
                UE_in_roi = false;
                return;
            end

            if UE_pos_y<roi_y_range(1) || UE_pos_y>roi_y_range(2)
                UE_in_roi = false;
                return;
            end
            UE_in_roi = true;
        end