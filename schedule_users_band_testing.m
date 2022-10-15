function[left_n_RBs, Is_traffic_high]=schedule_users_band_testing(obj,attached_UEs,last_received_feedbacks,TTI_MAX)
           % Power allocation
           % Nothing here. Leave the default one (homogeneous)
           RB_grid = obj.RBGrid;
           RB_grid.size_bits = 0;
           feedback_delay_TTIs = 1;
           % For now use the static tx_mode assignment
           
           RB_grid.size_bits = 0;
           %            tx_mode = obj.default_tx_mode;
           %            current_TTI = obj.clock.current_TTI;
           current_TTI = 1;
           N_UE = length(attached_UEs);
           N_RB = RB_grid.n_RB;
           %            UE_id_list = zeros(N_RB,1);
           
           
           maxStreams = 2;
           avg_throughput = zeros(maxStreams,TTI_MAX);
           
           left_n_RBs=N_RB;
           Is_traffic_high=false;
           
           if ~isempty(attached_UEs)

               for u_ = 1:N_UE
                   
                   % Give a percentage to the broadcast UEs, not all the UEs
                   % send CAM traffic simutaneously
                   %  if attached_UEs(u_).id==2 || attached_UEs(u_).id==12 || attached_UEs(u_).id==22 || attached_UEs(u_).id==34 || attached_UEs(u_).id==52 || attached_UEs(u_).id==67 || attached_UEs(u_).id==77
                   %     attached_UEs(u_).traffic_model.check_TTI;
                   %  else
                   %
                   broadcast_UEs_percentage= 0.4;
                   
                   coin_toss = rand;
                   if coin_toss < broadcast_UEs_percentage
                       state = true;
                   else
                       state = false;
                   end
                   if state == true
                       attached_UEs(u_) = check_TTI(attached_UEs(u_),current_TTI);
                   end
               end
%                for u_ = 1:N_UE
%                    attached_UEs(u_).traffic_model.check_TTI;
%                    
%                end
 %% compute efficiency 
      [c,user_ind,N_UE] = get_efficiency(N_RB,last_received_feedbacks,obj.k,obj.d);          
      c = c';   
      
     %% update average throughput
      TTI_to_read = max(current_TTI-feedback_delay_TTIs-1,1); % Realistically read the ACKed throughput
      for uu = 1:N_UE
        obj.av_throughput(uu) = compute_av_throughput( attached_UEs(uu),TTI_to_read,avg_throughput);
      end 
               
     %% Proportional fair traffic scheduler

      [left_n_RBs, Is_traffic_high]= Traffic_evaluation(obj,N_UE,N_RB,c,user_ind,attached_UEs);
           end
 
% %% compute efficiency
% %                 [c,user_ind] = obj.get_efficiency(N_UE,N_RB,last_received_feedbacks);          
% %                 c = c';              
% %                              
% %                %% update average throughput
% %                TTI_to_read = max(current_TTI-obj.feedback_delay_TTIs-1,1); % Realistically read the ACKed throughput
% %                for uu = 1:N_UE
% %                     obj.av_throughput(uu) = obj.compute_av_throughput(uu,last_received_feedbacks,TTI_to_read);
% %                end               
% %                
%                %% Proportional fair traffic scheduler
%           
%               [left_n_RBs, Is_traffic_high]= obj.Traffic_evaluation(N_UE,N_RB,c,user_ind,attached_UEs);
%                
% %                for r_ = 1:N_RB
% %                    RB_tmp = RBs((r_-1)*N_UE+1:r_*N_UE);
% %                    ind = find(RB_tmp == 1);
% %                   if ~isempty(ind)
% %                     UE_id_list(r_) = attached_UEs(user_ind(ind)).id;
% %                   end
% %                end              
% %                RB_grid.user_allocation(:) = UE_id_list;
% %                % CQI assignment. TODO: implement HARQ          
% % %                obj.schedule_users_common(RB_grid,attached_UEs,last_received_feedbacks,current_TTI,tx_mode);   %RB_grid removed!!!
% %                obj.schedule_users_common(attached_UEs,last_received_feedbacks,current_TTI,tx_mode);
%            end
%        end