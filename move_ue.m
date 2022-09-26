        function new_pos = move_ue(current_pos,obj)
            mov_vector = obj.speed * [ cosd(obj.direction) sind(obj.direction) ];
            new_pos = current_pos + mov_vector;
        end