
Totalchl = Chlzt+Czt;
Chlintegratedepi = transpose(mean(Totalchl(1:4,1:14798)));

TDP = Pzt+DOPzt;
TDPintegratedepi = transpose(mean(TDP(1:4,1:14798)));

TP = Pzt + PPzt + DOPzt;
TPintegratedepi = transpose(mean(TP(1:4,1:14798)));

M = [dum(1:14798,1:3) Chlintegratedepi, TDPintegratedepi, TPintegratedepi];
xlswrite(ModelOutput,M);


for i=1:length(Obs_TP_Chla)
inx=find(Obs_TP_Chla(i,1:3))==M(:,1:3);
 if(isempty(inx)==0)
%  subplot(221)  
%  plot(Obs_TP_Chla(i,4),monthly_qual(inx,5),'b.')
%  hold on
%  subplot(222)  
%  plot(Obs_TP_Chla(i,5),monthly_qual(inx,6),'b.')
%  hold on
 end
end