        function [channel_out, delays, out, normalization_factor] = generate_channel_trace(N_subframes,winner_params,winner_antenna_array,varargin)
            % LTE winner channel model - to generate channel realization using Winner
            % Model II [1]
            %
            % Author: Michal Simko, msimko@nt.tuwien.ac.at
            % Modified by Josep Colom Ikuno, jcolom@nt.tuwien.ac.at
            % (c) 2011 by INTHFT
            % www.nt.tuwien.ac.at
            %
            % [1]   IST-WINNER D1.1.2 P. Kyösti, et al., "WINNER II Channel Models", ver 1.1, Sept. 2007.
            %       Available: https://www.ist-winner.org/WINNER2-Deliverables/D1.1.2v1.1.pdf
            %
            % input :   N_subframes                 ... [1x1]   number of channel realization
            %           Arrays                      ... struct  -> antenna specification
            %           out                         ... struct  -> state of previous channel generation using winner model
            % output:   channel                     ... [ x ] channel matrix
            %           delays                      ... [ x ] delays matrix
            %           out                         ... struct  -> output state of the winner model
            %
            % date of creation: 2009/10/12
            % last changes: 2008/12/12  Simko
            
            init_params = winner_params;
            
            if isempty(winner_antenna_array)
                error('Winner channel model antenna array not initialized. Call first the load_antenna_array function.');
            else
                Arrays =  winner_antenna_array;
            end
            final_normalization = init_params.final_normalization;
            
            %% winner II channel model
            
            % set parameters {default option}
            wimpar=wimparset;
            wimpar.Scenario                 = ScenarioMapping(init_params.Scenario);
            wimpar.PropagCondition          = init_params.PropagCondition;                % [LOS,{NLOS}]
            switch init_params.filtering
                case 'BlockFading'
                    Channel_Sampling_Time = init_params.Tsubframe;
                case 'FastFading'
                    Channel_Sampling_Time = init_params.SamplingTime;
            end
            SampleDensity = init_params.speed_of_light/(2*init_params.carrier_freq*Channel_Sampling_Time*init_params.speed);
            
            wimpar.SampleDensity           = SampleDensity;                      % number of time samples per half wavelength [ {2} ]
            wimpar.NumTimeSamples          = N_subframes;                        % number of time samples [ {100} ]
            wimpar.UniformTimeSampling     = init_params.UniformTimeSampling;    % Use same time sampling grid for all links [ yes | {no} ]
            wimpar.FixedPdpUsed            = init_params.FixedPdpUsed;           % nonrandom path delays and powers [ yes | {no}]
            wimpar.FixedAnglesUsed         = init_params.FixedAnglesUsed;        % nonrandom AoD/AoAs [ yes | {no} ]
            wimpar.PolarisedArrays         = init_params.PolarisedArrays;        % usage of dual polarised arrays [ {yes} | no ]
            wimpar.TimeEvolution           = init_params.TimeEvolution;          % usage of time evolution  [ yes | {no} ]
            wimpar.CenterFrequency         = init_params.carrier_freq;           % carrier frequency in Herz [ {5.25e9} ]
            wimpar.DelaySamplingInterval   = init_params.SamplingTime;           % delay sampling grid [ {5e-9} ]init_params.SamplingTime
            wimpar.PathLossModelUsed       = init_params.PathLossModelUsed;      % usage of path loss model [ yes | {no} ]
            wimpar.ShadowingModelUsed      = init_params.ShadowingModelUsed;     % usage of shadow fading model [ yes | {no} ]
            wimpar.PathLossModel           = init_params.PathLossModel;          % path loss model function name [ {pathloss} ]
            wimpar.PathLossOption          = init_params.PathLossOption;         % ['{CR_light}' or 'CR_heavy' or 'RR_light' or 'RR_heavy', CR = Corridor-Room, RR = Room-Room nlos}
            wimpar.RandomSeed              = init_params.RandomSeed;             % sets random seed [ {[empty]} ]
            wimpar.UseManualPropCondition  = init_params.UseManualPropCondition; % whether to use manual propagation condition (los/nlos) setting or not. If not, the propagation condition is drawn from probabilities.  [ {yes} | no]
            
            
            % MsAAIdx = init_params.UE_config.nRX * ones(1,init_params.nUE);
            % BsAAIdxCell = {[init_params.BS_config.nTx + 4]};
            MsAAIdx = ones(1,init_params.nUE);   %every user is using antenna defined Arrays(1)
            BsAAIdxCell = {[2]};    %   base station is using antenna defined Arrays(2)
            
            layoutpar=layoutparset(MsAAIdx,BsAAIdxCell,init_params.nUE,Arrays);
            
            layoutpar.ScenarioVector = init_params.Scenario*ones(1,init_params.nUE); % 1=A1, 2=A2, 3=B1, 4=B2, 5=B3, 6=B4, 7=B5a, 8=B5c, 9=B5f, 10=C1,
            % 11=C2, 12=C3, 13=C4, 14=D1 and 15=D2a
            % for more details look in  ScenarioMapping.mat
            switch init_params.PropagCondition
                case 'LOS'
                    layoutpar.PropagConditionVector =1*ones(1,init_params.nUE);  %   (NLOS=0/LOS=1)
                case 'NLOS'
                    layoutpar.PropagConditionVector =0*ones(1,init_params.nUE);  %   (NLOS=0/LOS=1)
            end
            for uu = 1:init_params.nUE
                layoutpar.Stations(1,uu+1).Velocity = [init_params.speed;0;0];
            end
            
            optargin = size(varargin,2);
            if optargin==1
                out = varargin{1};
                [channel, delays, out] = wim(wimpar,layoutpar,out);
            elseif optargin==0
                [channel, delays, out] = wim(wimpar,layoutpar);
            else
                error('Wrong number of input variables');
            end
            delays = round(delays/init_params.SamplingTime);             %   correct sampling in the delay domain
            
            % Set normalization factor
            normalization_factor_exists = ~isempty(init_params.normalization_factor);
            if final_normalization && normalization_factor_exists;
                normalization_factor = init_params.normalization_factor;
            else
                normalization_factor = ones(1,init_params.nUE);
            end
            % Initialize output
            channel_out = cell(1,init_params.nUE);
            
            % Final procedures
            for user_i = 1:init_params.nUE
                channel{user_i}(isnan(channel{user_i})) = 0;
                channel_matrix_size = size(channel{user_i});
                channel_matrix_size(3) = max(delays(user_i,:))+1;
                channel_out{user_i} = zeros(channel_matrix_size);
                
                for tap_i = 1:channel_matrix_size(3)
                    tap_positions = find(delays(user_i,:) == tap_i-1);
                    if sum(tap_positions)>0
                        channel_out{user_i}(:,:,tap_i,:) = sum(channel{user_i}(:,:,tap_positions,:),3);
                    end
                end
                
                % Channel normalization
                if final_normalization
                    if ~normalization_factor_exists
                        channel_energy = mean(sum(sum(sum(abs(channel_out{user_i}).^2,3),2),1),4); % mean channel energy = sum over transmit and receive antennas and over taps energies averaged over all realizations
                        normalization_factor(user_i) = sqrt(init_params.UE_config.nRX * init_params.BS_config.nTx) / sqrt(channel_energy);
                        winner_params.normalization_factor = normalization_factor;
                    end
                    channel_out{user_i} = normalization_factor(user_i) * channel_out{user_i}; % channel is normalized to have mean energy Nt*Nr
                else
                    % Do nothing (no normalization)
                end
                
                % Since the old channel trace has the last two dimensions
                % ordered as time,taps, instead of the taps,time which is used
                % here, we need to perform a permutation.
                channel_out{user_i} = permute(channel_out{user_i},[1 2 4 3]);
            end
            
            % Since we are only generating the trace for one user, we do
            % not need the output to be a cell array
            channel_out = channel_out{1};
            normalization_factor = normalization_factor(1);
        end