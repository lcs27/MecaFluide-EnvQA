%% Paramètre météo
v= 5;%vitesse du vent à la hauteur de la cheminée [ms-1]
P= 1.005e5;%pression à la hauteur de la cheminée [Pa]
Ta= 288;%température de l'atmosphère à la hauteur de la cheminée [K.ATTENTION]

%% Paramètre de cas
v_comb = 20; %[g/m2/s] vitesse de combustion des fumées
PCI = 30e3; %[J/g] chaleur de combustion
S = 20000; %[m2] Surface du combustible en feu
W = v_comb*S*PCI*10^-6; %puissance thermique émise par le foyer [MW]
Q = 3.24*W; %Débit total de fumées traversant la section à hauteur d'émission  [kg/s]
Hs= 90; %Hauteur réel [m]
d= 160; %diamètre de cheminée[m]
Ts= 523;%température de terme source [K, ATTENTION]
dT = Ts - Ta;%différence de température à hauteur d'éjection des fumées
U = 0.54*(dT*W)^(1/5); %vitesse d'émission des fumées, 