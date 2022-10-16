function per_UE_FFR_mapping_object = assign_FFR_band_to_UEs(UEs,FR_SINR_switching_dB,networkPathlossMap)
all_UEs_pos                 = reshape([UEs.pos],2,[])';
all_UEs_pos_pix             = LTE_common_pos_to_pixel( all_UEs_pos,networkPathlossMap.coordinate_origin, networkPathlossMap.data_res);
all_UEs_pos_pix_lin_idx     = sub2ind(size(networkPathlossMap.SINR), all_UEs_pos_pix(:,2), all_UEs_pos_pix(:,1));
SINRs_FR_dB                 = networkPathlossMap.SINR(all_UEs_pos_pix_lin_idx);
FFR_mapping                 = double(SINRs_FR_dB>=FR_SINR_switching_dB); % FR users
FFR_mapping(FFR_mapping==0) = 2;                                         % PR users
per_UE_FFR_mapping_object   = utils.ffrUEmapping(FFR_mapping);
end