function plot_wideband_SINR()
   a_figure = figure(4);
  wideband_SNIR_nc = load('nocomp_wide_snir.txt');
  wideband_SINR_ecdf_nc = ecdf_x(wideband_SNIR_nc);

  
  wideband_SNIR = load('wide_snir.txt');
  wideband_SINR_ecdf = ecdf_x(wideband_SNIR);

  
  wideband_SNIR_wo = load('w.o_wide_snir.txt');
  wideband_SINR_ecdf_wo = ecdf_x(wideband_SNIR_wo);
  
  UE_wideband_SINR_axes        = axes('Parent',a_figure);
      % Wideband SINR ECDF
    hold(UE_wideband_SINR_axes,'all');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_wo.x,wideband_SINR_ecdf_wo.f,'green');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf_nc.x,wideband_SINR_ecdf_nc.f,'red');
    plot(UE_wideband_SINR_axes,wideband_SINR_ecdf.x,wideband_SINR_ecdf.f,'blue');
    
    legend('Urban w.o.(ICIC+CS CoMP)','Urban w. (ICIC)','Urban w.(ICIC+CS CoMP)')
    grid(UE_wideband_SINR_axes,'on');
    title(UE_wideband_SINR_axes,'UE outage probability');
    xlabel(UE_wideband_SINR_axes,'SINR Threshold [dB]');
    ylabel(UE_wideband_SINR_axes,'Outage Probability');
    

    a_figure = figure(6);
    wide_interference_nc = load('nocomp_interference.txt');
    inter_mat_ecdf_nc = ecdf_x(wide_interference_nc);
    
    wide_interference = load('interference.txt');
    inter_mat_ecdf = ecdf_x(wide_interference);
    
    wide_interference_wo = load('w.o_interference.txt');
    inter_mat_ecdf_wo = ecdf_x(wide_interference_wo);
    
    UE_int_SINR_axes        = axes('Parent',a_figure);
    hold(UE_int_SINR_axes,'all');
    
    plot(UE_int_SINR_axes,inter_mat_ecdf.x,inter_mat_ecdf.f,'blue');
    plot(UE_int_SINR_axes,inter_mat_ecdf_nc.x,inter_mat_ecdf_nc.f,'red');
    plot(UE_int_SINR_axes,inter_mat_ecdf_wo.x,inter_mat_ecdf_wo.f,'green');
    legend('Urban w.(ICIC+CS CoMP)','Urban w. (ICIC)','Urban w.o.(ICIC+CS CoMP)')
    grid(UE_int_SINR_axes,'on');
    title(UE_int_SINR_axes,'LTE UE interference');
    xlabel(UE_int_SINR_axes,'interference [dB]');
    ylabel(UE_int_SINR_axes,'CDF');
    end