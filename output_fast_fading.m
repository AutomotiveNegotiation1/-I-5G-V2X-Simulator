function pregenerated_fast_fading = output_fast_fading (SISO_trace, trace_length_s,TTI_length)

            pregenerated_fast_fading                      = phy_modeling.PregeneratedFastFading;
            pregenerated_fast_fading.trace_length_s       = trace_length_s;
            pregenerated_fast_fading.trace_length_samples = trace_length_s / 1e-3;
            pregenerated_fast_fading.system_bandwidth     = 10000000;
            pregenerated_fast_fading.channel_type         = 'winner+';
            pregenerated_fast_fading.nTX                  = 1;
            pregenerated_fast_fading.nRX                  = 1;
            pregenerated_fast_fading.UE_speed             = 16.667;
            
            pregenerated_fast_fading.t_step               = 1e-3;
            pregenerated_fast_fading.f_step               = 15e3*6;
            
            pregenerated_fast_fading.traces{1}            = SISO_trace; 
            
end