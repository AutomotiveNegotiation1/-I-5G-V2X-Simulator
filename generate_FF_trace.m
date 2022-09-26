        function pregen_H_trace = generate_FF_trace(N_subframes,winner_params,winner_antenna_array)
            % Shorthand naming
            number_of_realizations_per_loop = Inf;
            nRX = 1;
            nTX = 1;
            
            %% Separate the N_subframes in smaller chunks to avoid memory problems
            % Read the comment under the 'number_of_realizations_per_loop'
            % object attribute to know more about this segmentation code
            % (which is actually not used)
            if isfinite(number_of_realizations_per_loop)
                sim_segmentation = number_of_realizations_per_loop*ones(1,floor(N_subframes/number_of_realizations_per_loop));
                remanent = rem(N_subframes,number_of_realizations_per_loop);
                if remanent > 0
                    sim_segmentation = [sim_segmentation remanent];
                end
                number_of_loops = length(sim_segmentation);
                begin_pos = zeros(size(sim_segmentation));
                end_pos   = begin_pos;
                begin_pos(1) = 1;
                end_pos(1)   = sim_segmentation(1);
                for i_=2:number_of_loops
                    begin_pos(i_) = end_pos(i_-1)+1;
                    end_pos(i_)   = end_pos(i_-1)+sim_segmentation(i_);
                end
            else
                number_of_loops  = 1;
                sim_segmentation = N_subframes;
                begin_pos        = 1;
                end_pos          = N_subframes;
            end
            Ntot = 600;
            FFT_sampling_interval = 6;
            Nfft=1024;
            tSubframe = 1.0e-03;
            speed = 16.6667;
            %% Create output, where the pregenerated fast fading will be stored
            pregen_H_trace.channel_model_name = 'Winner+';
            pregen_H_trace.fs                 = 15360000;
            pregen_H_trace.H_RB_samples       = zeros(nRX,nTX,N_subframes,Ntot/FFT_sampling_interval);
            pregen_H_trace.fft_points         = Nfft;
            pregen_H_trace.t_start            = 0;
            pregen_H_trace.t_end              = (N_subframes-1)*tSubframe;
            pregen_H_trace.t_step             = tSubframe;
            pregen_H_trace.t_length           = N_subframes;
            pregen_H_trace.UE_speed           = speed;
            
            load_antenna_array=[];
            
            for i_=1:number_of_loops
                if i_==1
                    [channel, delays, out, normalization_factor] = generate_channel_trace(sim_segmentation(i_),winner_params,winner_antenna_array);
                else
                    [channel, delays, out, normalization_factor] = generate_channel_trace(sim_segmentation(i_),winner_params,winner_antenna_array,out);
                end
                samples = begin_pos(i_):end_pos(i_);
                pregen_H_trace.H_RB_samples(:,:,samples,:) = get_RB_trace(channel);
            end
        end