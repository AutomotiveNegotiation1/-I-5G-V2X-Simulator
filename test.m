VUE_layout(:,5)=((-250<VUE_layout(:,1)&VUE_layout(:,1)<83) | (250< VUE_layout(:,1) & 334> VUE_layout(:,1))) & 577 < VUE_layout(:,2);

for x_ = 1:length(VUE_layout)
    if VUE_layout(x_,5)
       VUE_layout(x_,1:2) =  VUE_layout(x_,1:2) - [250 1299];
    end
end