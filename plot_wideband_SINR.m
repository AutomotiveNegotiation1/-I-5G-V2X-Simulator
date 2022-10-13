function plot_wideband_SINR()
   a_figure = figure(4);
  wideband_SNIR_nc = load('5G_nocomp_wide_snir.txt');
  wideband_SINR_ecdf_nc = ecdf_x(wideband_SNIR_nc);

  
  wideband_SNIR = load('5G_wide_snir.txt');
  wideband_SINR_ecdf = ecdf_x(wideband_SNIR);

  
  wideband_SNIR_wo = load('5G_w.o_wide_snir.txt');
  wideband_SINR_ecdf_wo = ecdf_x(wideband_SNIR_wo);
  
  wideband_SNIR_ni = load('5G_noicic_wide_snir.txt');
  wideband_SINR_ecdf_ni = ecdf_x(wideband_SNIR_ni);
  
  
  
  UE_wideband_SINR_axes        = axes('Parent',a_figure);
      % Wideband SINR ECDF
    hold(UE_wideband_SINR_axes,'all');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_wo.x,wideband_SINR_ecdf_wo.f,'green');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_nc.x,wideband_SINR_ecdf_nc.f,'red');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_ni.x,wideband_SINR_ecdf_ni.f,'black');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf.x,wideband_SINR_ecdf.f,'blue');
    
    legend('Urban w.o.(ICIC+CS CoMP)','Urban w. (Dynamic ICIC)','Urban w. (CS CoMP)','Urban w.(Dynamic ICIC+CS CoMP)')
    grid(UE_wideband_SINR_axes,'on');
    title(UE_wideband_SINR_axes,'5G UE outage probability');
    xlabel(UE_wideband_SINR_axes,'SINR Threshold [dB]');
    ylabel(UE_wideband_SINR_axes,'Outage Probability');
    

    a_figure = figure(6);
    wide_interference_nc = load('5G_nocomp_interference.txt');
    inter_mat_ecdf_nc = ecdf_x(wide_interference_nc);
    
    wide_interference_ni = load('5G_noicic_interference.txt');
    inter_mat_ecdf_ni = ecdf_x(wide_interference_ni);
    
    wide_interference = load('5G_interference.txt');
    inter_mat_ecdf = ecdf_x(wide_interference);
    
    wide_interference_wo = load('5G_w.o_interference.txt');
    inter_mat_ecdf_wo = ecdf_x(wide_interference_wo);
    
    UE_int_SINR_axes        = axes('Parent',a_figure);
    hold(UE_int_SINR_axes,'all');
    
    plot(UE_int_SINR_axes,inter_mat_ecdf.x,inter_mat_ecdf.f,'blue');
    plot(UE_int_SINR_axes,inter_mat_ecdf_nc.x,inter_mat_ecdf_nc.f,'red');
    plot(UE_int_SINR_axes,inter_mat_ecdf_ni.x,inter_mat_ecdf_ni.f,'black');
    plot(UE_int_SINR_axes,inter_mat_ecdf_wo.x,inter_mat_ecdf_wo.f,'green');
    legend('Urban w.(Dynamic ICIC+CS CoMP)','Urban w. (Dynamic ICIC)','Urban w. (CS CoMP)','Urban w.o.(Dynamic ICIC+CS CoMP)')
    grid(UE_int_SINR_axes,'on');
    title(UE_int_SINR_axes,'5G UE interference');
    xlabel(UE_int_SINR_axes,'interference [dB]');
    ylabel(UE_int_SINR_axes,'CDF');
    end