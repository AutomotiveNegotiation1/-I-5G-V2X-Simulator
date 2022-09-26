function trace_to_fill = trace_SISO(H_trace_normalized,H_trace_interf_normalized )
            % Generate the fading trace for the SISO LTE mode
            % Author: Josep Colom Ikuno, jcolom@nt.tuwien.ac.at.
            % (c) 2009 by INTHFT
            % www.nt.tuwien.ac.at
            
            % Re-create config params from input
            system_bandwidth = 10000000;
            channel_type     = 'winner+';
            nTX              = 1;
            nRX              = 1;
            trace_length_s   = 5;
            frequency        = 2.000000000000000e+09;
            UE_speed         = 16.6667;
            
            nTTIs       = size(H_trace_normalized,3);
            nSC_samples = size(H_trace_normalized,4);
            Um1         = size(H_trace_normalized,1);
            Um2         = size(H_trace_normalized,2);


            % chi doesn't exist, as there is only one stream being transmitted
            zeta = ones([nSC_samples,nTTIs]); % Already permuted
            switch nRX
                case 1
                    % Directly calculate the inverse
                    inv_H = 1./H_trace_normalized;
                    psi   = reshape(abs(inv_H).^2,[nTTIs,nSC_samples]);
                   theta = reshape(abs(inv_H .* H_trace_interf_normalized).^2,[nTTIs,nSC_samples]);
                otherwise
                    % Calculate MRC for SIMO case
                    h_H_h   = sum(conj(H_trace_normalized).*H_trace_normalized,1);
                    h_i_H_h = sum(conj(H_trace_normalized).*H_trace_interf_normalized,1);
                    psi     = reshape(sum(abs(conj(H_trace_normalized)./h_H_h(ones(1,nRX),:,:,:)).^2,1),[nTTIs,nSC_samples]);
                    theta   = reshape(abs(h_i_H_h ./ h_H_h).^2,[nTTIs,nSC_samples]);
            end
            
            % Rearrange dimensions in the new form (v1.2)
            psi   = permute(psi,[2 1]);
            theta = permute(theta,[2 1]);
            
            %% Fill in the output trace object
            trace_to_fill                  = phy_modeling.txModeTrace;
            trace_to_fill.tx_mode          = 1;
            trace_to_fill.trace_length_s   = trace_length_s;
            trace_to_fill.system_bandwidth = system_bandwidth;
            trace_to_fill.channel_type     = channel_type;
            trace_to_fill.nTX              = nTX;
            trace_to_fill.nRX              = nRX;
            trace_to_fill.UE_speed         = UE_speed;
            
            trace_to_fill.trace.zeta  = zeta;
            trace_to_fill.trace.psi   = psi;
            trace_to_fill.trace.theta = theta;
            
            %% Some plotting
            
            if 0
                figure;
                hold on;
                plot(squeeze(zeta(1,:)),'r','Displayname','\zeta (RX power)');
                plot(squeeze(psi(1,:)),'b','Displayname','\psi (noise enhancement)');
                plot(squeeze(theta(1,:)),'m','Displayname','\theta (inter-cell interference)');
                set(gca,'Yscale','log');
                title('SISO, subcarrier 1');
                grid on;
                legend('show','Location','best');
            end
        end