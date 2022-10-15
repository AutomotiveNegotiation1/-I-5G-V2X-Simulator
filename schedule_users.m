 function obj=schedule_users(obj,attached_UEs,last_received_feedbacks,TTI_MAX)
           % Redirect the feedbacks to their correct scheduler and do the same with the attached UEs.
          if ~isempty(attached_UEs)  % add by me
              
         
           %% for band allocation DFFR, due to bonus band, the band will be realocate each TTI 
%           RBs_FR  =round(obj.RB_grid.n_RB*obj.beta_FR);
%            RBs_PR_full=obj.RB_grid.n_RB-RBs_FR;
%            mod_reuse=mod(RBs_PR_full,obj.reuse_factor);
%             % Handle extreme cases
%            if obj.beta_FR == 0
%                obj.use_FR = false;
%            else
%                obj.use_FR = true;
%            end
%            
%            if obj.beta_FR==1 && mod(obj.RB_grid.n_RB-RBs_FR,obj.reuse_factor)==0
%                obj.use_PR = false;
%            else
%                obj.use_PR = true;
%            end
%            
%                      
%            % Always take out from the FR zone: very slight (almost unnoticeable) degradation of peak and mean but increase in edge (according to theory)
%            if mod_reuse~=0
%                if RBs_FR>0
%                    RBs_FR = RBs_FR - (obj.reuse_factor-mod_reuse);
%                else
%                    % Safeguard for the case where no FR are present
%                    RBs_FR = RBs_FR + mod_reuse;
%                end
%            end
%            
%            RBs_PR_full = obj.RB_grid.n_RB-RBs_FR;
%            RBs_PR      = RBs_PR_full/obj.reuse_factor;
%            
%            obj.FR_assignment           = false(1,obj.RB_grid.n_RB);
%            obj.FR_assignment(1:RBs_FR) = true;
%            
%            PR_offset                                         = RBs_FR+(obj.PR_band-1)*RBs_PR+1;
%            obj.PR_assignment                                 = false(1,obj.RB_grid.n_RB);
%            obj.PR_assignment(PR_offset:(PR_offset+RBs_PR-1)) = true;
%            
%            obj.FR_scheduler.fractional_BW_allocation = true;
%            obj.FR_scheduler.fractional_allocation    = obj.FR_assignment;
%            obj.PR_scheduler.fractional_BW_allocation = true;
%            obj.PR_scheduler.fractional_allocation    = obj.PR_assignment;
%            
%            % Substitute their RB_grid with a "fake" version
%            obj.FR_scheduler.RB_grid = utils.ffrUtils.filter_RB_grid(obj.RB_grid,obj.FR_assignment);
%            obj.PR_scheduler.RB_grid = utils.ffrUtils.filter_RB_grid(obj.RB_grid,obj.PR_assignment);     
            RBs_FR= obj.RBs_FR_original;
       
              
              %%
           attached_UEs_id = [attached_UEs.UE_ID];
           [FR_UEs_idx PR_UEs_idx] = get_assignment(obj.UE_assignment,attached_UEs_id);
           FR_UEs = attached_UEs(FR_UEs_idx);
           PR_UEs = attached_UEs(PR_UEs_idx);
           
           [FR_feedback PR_feedback] = utils.ffrUtils.separate_feedback_FFR(last_received_feedbacks,obj.FR_assignment,obj.PR_assignment,FR_UEs_idx,PR_UEs_idx);
           
           
           %% add for DFFR  only enable when 
           % check resources
            if obj.use_FR
                  [left_n_RBs_FR, Is_traffic_high_FR]= schedule_users_band_testing(obj.FR_scheduler,FR_UEs,FR_feedback,TTI_MAX);
           end
           if obj.use_PR
                [left_n_RBs_PR, Is_traffic_high_PR]=schedule_users_band_testing(obj.PR_scheduler,PR_UEs,PR_feedback,TTI_MAX);
           end
           
           if (Is_traffic_high_PR&&(~Is_traffic_high_FR))&&~obj.is_bonus_RBs_allocated&&left_n_RBs_FR>obj.n_bonus_RBs
           %% allocate the bonus band to PR_zone
               mod_rbs=mod(left_n_RBs_FR,3);
             %  n_bonus_RBs=(left_n_RBs_FR-mod_rbs)/3;
               %delta_beta_FR=(left_n_RBs_FR/obj.RB_grid.n_RB);
           bonus_offset=RBs_FR-obj.PR_band*obj.n_bonus_RBs+1;
           RBs_FR=RBs_FR-obj.n_bonus_RBs; %number of FR_RBs after
       
           obj.FR_assignment(bonus_offset:bonus_offset+obj.n_bonus_RBs-1)=false;
          
           obj.PR_assignment(bonus_offset:bonus_offset+obj.n_bonus_RBs-1)=true;
           
           obj.FR_scheduler.fractional_allocation=obj.FR_assignment;
           obj.PR_scheduler.fractional_allocation=obj.PR_assignment;
                    
           
           
           obj.FR_scheduler.RBGrid = utils.ffrUtils.filter_RB_grid(obj.RBGrid,obj.FR_assignment);
           obj.PR_scheduler.RBGrid = utils.ffrUtils.filter_RB_grid(obj.RBGrid,obj.PR_assignment);      
           obj.is_bonus_RBs_allocated=true;
           end
           if (Is_traffic_high_FR&&(~Is_traffic_high_PR)&&obj.is_bonus_RBs_allocated&&left_n_RBs_PR>obj.n_bonus_RBs)
           %% release the bonus band to FR_zone

           bonus_offset=RBs_FR-obj.PR_band*obj.n_bonus_RBs+1;
           obj.FR_assignment(bonus_offset:bonus_offset+obj.n_bonus_RBs-1)=true;

           obj.PR_assignment(bonus_offset:bonus_offset+obj.n_bonus_RBs-1)=false;
           
           obj.FR_scheduler.fractional_allocation=obj.FR_assignment;
           obj.PR_scheduler.fractional_allocation=obj.PR_assignment;
           
           obj.FR_scheduler.RBGrid = utils.ffrUtils.filter_RB_grid(obj.RBGrid,obj.FR_assignment);
           obj.PR_scheduler.RBGrid = utils.ffrUtils.filter_RB_grid(obj.RBGrid,obj.PR_assignment);      
           obj.is_bonus_RBs_allocated=false;
           
           end
            % after bonus band alloction, the feedback should be separated
            % again
             [FR_feedback PR_feedback] = utils.ffrUtils.separate_feedback_FFR(last_received_feedbacks,obj.FR_assignment,obj.PR_assignment,FR_UEs_idx,PR_UEs_idx);
           %% 
           % Schedule FR and PR zones: The lteScheduler class has been modified to support a modified writing to the eNodeBSignaling object.
           if obj.use_FR
               obj.FR_scheduler=schedule_users2(obj.FR_scheduler,FR_UEs,FR_feedback,TTI_MAX);
           end
           if obj.use_PR
               obj.PR_scheduler=schedule_users2(obj.PR_scheduler,PR_UEs,PR_feedback,TTI_MAX);
           end
           
           % Normalize the powers of the FR and scheduled parts
           obj=normalize_partial_RB_power_allocation(obj);
           
           % Fill in UE signaling telling the UEs to calculate any wideband feedback (RI, basically), based on only the following RBs
           if obj.use_FR
               the_FR_assignment = obj.FR_assignment;
               the_FR_RBGrid    = obj.FR_scheduler.RBGrid;
           else
               the_FR_assignment = [];
               the_FR_RBGrid    = [];
           end
           if obj.use_PR
               the_PR_assignment = obj.PR_assignment;
               the_PR_RBGrid    = obj.PR_scheduler.RBGrid;
           else
               the_PR_assignment = [];
               the_PR_RBGrid    = [];
           end
           
           for u_ = 1:length(FR_UEs)
               FR_UEs(u_).eNodeB_signaling.adaptive_RI.RBs_for_feedback = the_FR_assignment;
           end
           for u_ = 1:length(PR_UEs)
               PR_UEs(u_).eNodeB_signaling.adaptive_RI.RBs_for_feedback = the_PR_assignment;
           end
           
           % Merge the RB_grid object from the FR and PR parts
           obj.RBGrid=merge_RB_grids(obj.RBGrid,the_FR_RBGrid,the_PR_RBGrid,obj.FR_assignment,obj.PR_assignment);
       
           
           
          end
       end       