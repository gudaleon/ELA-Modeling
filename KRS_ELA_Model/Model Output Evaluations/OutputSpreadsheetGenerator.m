
Totalchl = Chlzt+Czt;
Chlintegratedepi = transpose(mean(Totalchl(1:4,1:14798)));

TDP = Pzt+DOPzt;
TDPintegratedepi = transpose(mean(TDP(1:4,1:14798)));

TP = Pzt + PPzt + DOPzt;
TPintegratedepi = transpose(mean(TP(1:4,1:14798)));

filename='/Users/krsalkgu/Documents/MATLAB/KRS_ELA_Model/L227_application/Model Output Evaluations/Output_IntegratedEpi.csv';
M = [dum(1:14798,1:3) datenum(dum(:,1:3)) Chlintegratedepi, TDPintegratedepi, TPintegratedepi];
csvwrite(filename,M);

figure(9)
clf
for i=1:length(Obs_TP_Chla)
inx=find(datenum(Obs_TP_Chla(i,1:3))==M(:,4));
 if(isempty(inx)==0)
 subplot(221)  
 plot(Obs_TP_Chla(i,4),M(inx,7),'b.')
 M2 = [Obs_TP_Chla(:,4) M(inx,7)];
 hold on
 subplot(222)  
 plot(Obs_TP_Chla(i,5),M(inx,5),'b.')
 hold on
 end
end
subplot(221)
axis('square')
axis([0 200 0 200])
xlabel('Observed')
ylabel('Modelled')
plot([0 200],[0 200],'--')
title(['Total P ({\mu}g/l)']);

subplot(222)
axis('square')
axis([0 100 0 100])
xlabel('Observed')
ylabel('Modelled')
plot([0 100],[0 100],'--')
title(['Chla {\ita} ({\mu}g/l)']); 

subplot(223)
for i=1:length(L227TDP)
inx=find(datenum(L227TDP(i,1:3))==M(:,4));
 if(isempty(inx)==0)
 plot(L227TDP(i,4),M(inx,6),'b.') %mg/m3
 hold on
 end
end
axis('square')
axis([0 100 0 100])
xlabel('Observed')
ylabel('Modelled')
plot([0 100],[0 100],'--')
title(['TDP (\mug/l)']); 
