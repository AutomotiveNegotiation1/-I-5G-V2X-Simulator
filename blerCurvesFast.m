function obj = blerCurvesFast(PER_curves,SNR_data)
           resolution = 0.05;
           N_CQIs = length(PER_curves);
           min_SINR = min(SNR_data{1});
           max_SINR = max(SNR_data{1});
           for i_=1:N_CQIs
               min_SINR = min([min_SINR SNR_data{i_}]);
               max_SINR = max([max_SINR SNR_data{i_}]);
           end
           SINR_range  = min_SINR:resolution:max_SINR;
           PER_matrix = zeros(N_CQIs,length(SINR_range));
           % Fill in the BLER data
           for i_=1:N_CQIs
               current_SNR  = SNR_data{i_};
               current_PER = PER_curves{i_};
               if current_SNR(1)>min_SINR
                   current_SNR  = [min_SINR current_SNR];
                   current_PER = [current_PER(1) current_PER];
               end
               if current_SNR(end)<max_SINR
                   current_SNR  = [current_SNR max_SINR];
                   current_PER = [current_PER current_PER(end)];
               end
               PER_matrix(i_,:) = interp1(current_SNR,current_PER,SINR_range);
           end
           obj.PER_data   = PER_matrix';
           obj.SNR_data    = SINR_range;
           obj.SINR_range  = [min_SINR max_SINR];
           obj.multipliers = reshape(0:length(SINR_range):length(SINR_range)*(N_CQIs-1),[],1);
       end