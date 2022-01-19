% Ce code a pour objectif de calculer la pollution stationnaire
% avec sommation de source supposée petite

%% data
data

%% Paramètre de domaine A ADAPTER
% Pas de l'espace
dx= 400; %maillage en x[m]
dy= 400; %maillage en y[m]
dz=75; %maillage en z[m]

% Limite de domaine
Lx=10000; %longeur en x[m]
Ly=10000; %longeur en y[m]
Lz=16000; %longeur en z[m]



%% Paramètre de source
Xs=100;% Longeur de source en x[m]
Ys=S/Xs;% Longeur de source en y[m]

dXs=5; %maillage de source en x[m]
dYs=5; %maillage de source en y[m]

Ns=(Xs/dXs+1)*(Ys/dYs+1); %Nombre de petit source
q=Q/Ns;%Quantité de petit source

% Définition de domaine de calcul 
all_x=[(Xs+1):(dx/25):(Lx/4),(Lx/4+dx/5):(dx/5):(Lx/2),(Lx/2+dx):dx:Lx];
all_y=[0:(dy/25):(Ly/4),(Ly/4+dy/5):(dy/5):(Ly/2),(Ly/2+dy):dy:Ly];
all_y=unique([-flip(all_y),all_y]);
[x,y,z]=meshgrid(all_x, all_y,0:dz:Lz);
%% Formule Gausienne
% Coefficient de dispersion A ADAPTER en fonction de classe 
C=zeros(size(x));
for xs=0:dXs:Xs
    for ys=(-Ys/2):dYs:(Ys/2)
        % Surhauteur
        delta_h= Briggs(U,d,v,P,Ts,Ta,x-xs);
        %delta_h=0;
        H=Hs+delta_h;
        sigma_y = 0.16.*(x-xs).*(1+0.0004.*(x-xs)).^(-1/2); %coefficient trouvé pour ciel couvert, mileu urbain et vitesse du vent ~5 ms-1
        sigma_z = 0.14.*(x-xs).*(1+0.0003.*(x-xs)).^(-1/2); %coefficient trouvé pour ciel couvert, mileu urbain et vitesse du vent ~5 ms-1
        C = C+q./(2.*pi.*U.*sigma_y.*sigma_z).*exp(-(y-ys).^2./(2*sigma_y.^2)-(z-H).^2./(2.*sigma_z.^2));
    end
    avancement=(xs)/Xs
end