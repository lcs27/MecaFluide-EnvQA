clear
load('stationnaire_petit.mat')
CO=0.037559564;
CO2=0.37559564;
HCL=1.45697E-06;
[M1,I1] = max(C);
[M2,I2] = max(M1);
[M3,I3] = max(M2);

subplot(3,1,1)
contourf(squeeze(x(:,:,1))/1e3,squeeze(y(:,:,1))/1e3,log10(max(C*CO,[],3)),log10([1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3]))
hold on;
scatter(x(I1(I2(I3)),I2(I3),I3)/1e3,y(I1(I2(I3)),I2(I3),I3)/1e3,'r*')
caxis([-10,-1])
xlabel('x[km]')
ylabel('y[km]','rotation',1)
title(['Concentration de CO'])
ylim([-4 4])
grid on
colorbar

subplot(3,1,2)
contourf(squeeze(x(:,:,1))/1e3,squeeze(y(:,:,1))/1e3,log10(max(C*CO2,[],3)),log10([1e-11,1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2]))
hold on;
scatter(x(I1(I2(I3)),I2(I3),I3)/1e3,y(I1(I2(I3)),I2(I3),I3)/1e3,'r*')
caxis([-11,-3])
xlabel('x[km]')
ylabel('y[km]','rotation',1)
title(['Concentration de CO2'])
ylim([-4 4])
grid on
colorbar

subplot(3,1,3)
contourf(squeeze(x(:,:,1))/1e3,squeeze(y(:,:,1))/1e3,log10(max(C*HCL,[],3)),log10([1e-16,1e-15,1e-14,1e-13,1e-12,1e-11,1e-10,1e-9,1e-8,1e-7]))
hold on;
scatter(x(I1(I2(I3)),I2(I3),I3)/1e3,y(I1(I2(I3)),I2(I3),I3)/1e3,'r*')
caxis([-16,-7])
xlabel('x[km]')
ylabel('y[km]','rotation',1)
title(['Concentration de HCl'])
ylim([-4 4])
grid on
colorbar