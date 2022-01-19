% Ce code a pour objectif de calculer la pollution stationnaire
% avec source ponctuelle 
%% data
data
%% Paramètre de domaine A ADAPTER
% Pas de l'espace
dx= 200; %maillage en x[m]
dy= 200; %maillage en y[m]
dz= 200; %maillage en z[m]

% Limite de domaine
Lx=20000; %longeur en x[m]
Ly=20000; %longeur en y[m]
Lz=20000; %longeur en z[m]

% Définition de domaine de calcul 
[x,y,z]=meshgrid(0:dx:Lx, -Ly:dy:Ly,0:dz:Lz);
%% Formule Gausienne
% Surhauteur
delta_h= Briggs(U,d,v,P,Ts,Ta,x);
%delta_h=0;
H=Hs+delta_h;
% Coefficient de dispersion A ADAPTER en fonction de classe 
sigma_y = 0.16.*x.*(1+0.0004.*x).^(-1/2); %coefficient trouvé pour ciel couvert, mileu urbain et vitesse du vent ~5 ms-1
sigma_z = 0.14.*x.*(1+0.0003.*x).^(-1/2); %coefficient trouvé pour ciel couvert, mileu urbain et vitesse du vent ~5 ms-1
C = Q./(2.*pi.*U.*sigma_y.*sigma_z).*exp(-y.^2./(2*sigma_y.^2)-(z-H).^2./(2.*sigma_z.^2));
