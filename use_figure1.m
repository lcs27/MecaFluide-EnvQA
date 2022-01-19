clear
idy=200;

subplot(2,1,1)
load('stationnaire.mat')
contourf(squeeze(x(idy,:,:))/1e3,squeeze(z(idy,:,:)),log10(squeeze(C(idy,:,:))),log10([1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]))
caxis([-10,-1])
xlabel('x[km]')
ylabel('z[m]','rotation',1)
title(['Modèle A'])
xlim([0.1,1])
ylim([0,2000])
grid on
colorbar


subplot(2,1,2)
hold on
load('stationnaire_petit.mat')
contourf(squeeze(x(idy,:,:))/1e3,squeeze(z(idy,:,:)),log10(squeeze(C(idy,:,:))),log10([1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]))
caxis([-10,-1])
xlabel('x[km]')
ylabel('z[m]','rotation',1)
title(['Modèle B'])

xlim([0.1,1])
ylim([0,2000])
grid on
colorbar