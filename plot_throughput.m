function plot_throughput()
            a_figure                     = figure(5);         
           UE_throughput_axes           = axes('Parent',a_figure);
         
           average_throughput_Mbps_nc = load('nocomp_avg_throughput_Mbps.txt');
           ind_nc = find(average_throughput_Mbps_nc ~= 0);
           out_nc = average_throughput_Mbps_nc(ind_nc);
           out_nc = [out_nc;0];
           throughput_Mbps_ecdf_nc = ecdf_x(out_nc);  
           
           average_throughput_Mbps = load('avg_throughput_Mbps.txt');
           ind = find(average_throughput_Mbps ~= 0);
           out = average_throughput_Mbps(ind);
           out = [out;0];
           throughput_Mbps_ecdf = ecdf_x(out);  
           
           average_throughput_Mbps_wo = load('w.o_avg_throughput_Mbps.txt');
           ind_wo = find(average_throughput_Mbps_wo ~= 0);
           out_wo = average_throughput_Mbps_wo(ind_wo);
           out_wo = [out_wo;0];
           throughput_Mbps_ecdf_wo = ecdf_x(out_wo);  
             
             
             
             
             
%            average_throughput_Mbps = average_throughput_Mbps(1:3,:);
%            average_throughput_Mbps = reshape(average_throughput_Mbps,size(average_throughput_Mbps,1)*size(average_throughput_Mbps,2),1);
             %            [x,f] = ecdf(average_throughput_Mbps);
%            fairness_index       = sum(throughput_Mbps_ecdf.input_data).^2 / sum(throughput_Mbps_ecdf.input_data.^2) / sum(isfinite(throughput_Mbps_ecdf.input_data));
%            throughput_vector                          = throughput_Mbps_ecdf.input_data;
            % Throughput ECDF
           hold(UE_throughput_axes,'all');
           
           plot(UE_throughput_axes,throughput_Mbps_ecdf_wo.x,throughput_Mbps_ecdf_wo.f,'green');
           plot(UE_throughput_axes,throughput_Mbps_ecdf_nc.x,throughput_Mbps_ecdf_nc.f,'red');
           plot(UE_throughput_axes,throughput_Mbps_ecdf.x,throughput_Mbps_ecdf.f,'blue');
           
           legend('Urban w.o.(ICIC+CS CoMP)','Urban w. (ICIC)','Urban w.(ICIC+CS CoMP)')
           grid(UE_throughput_axes,'on');
           title(UE_throughput_axes,'LTE Average throughput');
           xlim([0 10]);
           xlabel(UE_throughput_axes,'UE Average throughput [Mb/s]');
           ylabel(UE_throughput_axes,'CDF');
    end