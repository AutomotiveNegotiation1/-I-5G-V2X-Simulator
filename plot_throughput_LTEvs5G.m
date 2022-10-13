function plot_throughput_LTEvs5G()
            a_figure                     = figure(5);         
           UE_throughput_axes           = axes('Parent',a_figure);
           
           average_throughput_Mbps = load('5G_avg_throughput_Mbps.txt');
           ind = find(average_throughput_Mbps ~= 0);
           out = average_throughput_Mbps(ind);
           out = [out;0];
           throughput_Mbps_ecdf_64QAM = ecdf_x(out);  
        
             
           average_throughput_Mbps_5G = load('5G_avg_throughput_Mbps_256QAM.txt');
           ind = find(average_throughput_Mbps_5G ~= 0);
           out = average_throughput_Mbps_5G(ind);
           out = [out;0];
           throughput_Mbps_ecdf_256QAM = ecdf_x(out);  

             
             

           hold(UE_throughput_axes,'all');

           plot(UE_throughput_axes,throughput_Mbps_ecdf_64QAM.x,throughput_Mbps_ecdf_64QAM.f,'red');
           plot(UE_throughput_axes,throughput_Mbps_ecdf_256QAM.x,throughput_Mbps_ecdf_256QAM.f,'blue');
 
         
           
           
           legend('5G V2X 64QAM Urban w. (CS CoMP & Dynamic ICIC)','5G V2X 256QAM Urban w. (CSCoMP & Dynamic ICIC)')
           grid(UE_throughput_axes,'on');
           title(UE_throughput_axes,'Average throughput');
           xlim([0 10]);
           xlabel(UE_throughput_axes,'UE Average throughput [Mb/s]');
           ylabel(UE_throughput_axes,'CDF');
    end