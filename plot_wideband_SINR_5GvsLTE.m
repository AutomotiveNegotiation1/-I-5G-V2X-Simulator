function plot_wideband_SINR()
   a_figure = figure(4);
  
   wideband_SNIR_5G = load('5G_wide_snir.txt');
   wideband_SINR_ecdf_5G = ecdf_x(wideband_SNIR_5G);
   
   wideband_SNIR = load('wide_snir.txt');
   wideband_SINR_ecdf = ecdf_x(wideband_SNIR);

  
  
  
  
  UE_wideband_SINR_axes        = axes('Parent',a_figure);
      % Wideband SINR ECDF
    hold(UE_wideband_SINR_axes,'all');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf.x,wideband_SINR_ecdf.f,'red');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_5G.x,wideband_SINR_ecdf_5G.f,'blue');
    
    legend('5G V2X 64QAM Urban w. (CS CoMP & Dynamic ICIC)','5G V2X 256QAM Urban w. (CS CoMP & Dynamic ICIC)')
    grid(UE_wideband_SINR_axes,'on');
    title(UE_wideband_SINR_axes,'UE outage probability');
    xlabel(UE_wideband_SINR_axes,'SINR Threshold [dB]');
    ylabel(UE_wideband_SINR_axes,'Outage Probability');
    

    a_figure = figure(6);

    wide_interference = load('interference.txt');
    inter_mat_ecdf = ecdf_x(wide_interference);
    
    wide_interference_5G = load('5G_interference.txt');
    inter_mat_ecdf_5G = ecdf_x(wide_interference_5G);

    UE_int_SINR_axes        = axes('Parent',a_figure);
    hold(UE_int_SINR_axes,'all');
    
    
    plot(UE_int_SINR_axes,inter_mat_ecdf.x,inter_mat_ecdf.f,'red');
    plot(UE_int_SINR_axes,inter_mat_ecdf_5G.x,inter_mat_ecdf_5G.f,'blue');
    
    legend('5G V2X 64QAM Urban w. (CS CoMP & Dynamic ICIC)','5G V2X 256QAM Urban w. (CS CoMP & Dynamic ICIC)')
    grid(UE_int_SINR_axes,'on');
    title(UE_int_SINR_axes,'UE interference');
    xlabel(UE_int_SINR_axes,'interference [dB]');
    ylabel(UE_int_SINR_axes,'CDF');
    end