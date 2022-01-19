clear

subplot(2,1,1)
load('stationnaire.mat')
contourf(squeeze(x(:,:,1))/1e3,squeeze(y(:,:,1))/1e3,log10(max(C,[],3)),log10([1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]))
caxis([-10,-1])
xlabel('x[km]')
ylabel('y[km]','rotation',1)
title(['Modèle A'])
grid on
colorbar

subplot(2,1,2)
hold off
load('stationnaire_petit.mat')
contourf(squeeze(x(:,:,1))/1e3,squeeze(y(:,:,1))/1e3,log10(max(C,[],3)),log10([1e-10,1e-9,1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]))
caxis([-10,-1])
xlabel('x[km]')
ylabel('y[km]','rotation',1)
title(['Modèle B'])
grid on
colorbar