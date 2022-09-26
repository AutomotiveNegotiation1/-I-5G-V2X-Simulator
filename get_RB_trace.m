 function H_fft_RB = get_RB_trace(channel)
            % Returns back a frequency channel trace jumping each FFT_sampling_interval subcarriers
            Nfft = 1024;
            Ntot = 600;
            FFT_sampling_interval=6;
            H_fft_large = fft(channel,Nfft,4);
            % Eliminate guardband
            H_fft       = H_fft_large(:,:,:,[Nfft-Ntot/2+1:Nfft 2:Ntot/2+1]);
            % Do not return the channel for all subcarriers, but just a subset of it
            H_fft_RB    = H_fft(:,:,:,1:FFT_sampling_interval:end);
        end