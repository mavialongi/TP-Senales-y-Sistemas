function RuidoRosa(t);
    %RUIDO ROSA. Sintetizador de ruido rosa
    %
    %Genera un audio de ruido rosa de "t" segundos. Definir el valor t(en segundos).  
    Nx = t*44100; %Cantidad de muestras a sintetizar.
    B = [0.049922035 -0.095993537 0.050612699 -0.004408786]; 
    A = [1 -2.494956002   2.017265875  -0.522189400]; %Coefcientes correspondientes al filtro de 3dB de caida.
    nT60 = round(log(1000)/(1-max(abs(roots(A))))); %Número de muestras que tardaria la señal en decaer de 0dB a -60dB, según los coeficientes del filtro.
    v = randn(1,Nx+nT60); %Vector de valores aleatorios de largo de muestras Nx más las correspondientes al nT60.
    x = filter(B,A,v); %Filtrado de la señal.
    X = x(nT60+1:end); %Se quitan los valores anteriores a nT60, correspondientes al transitorio de la señal.
    audiowrite('Ruido_Rosa.wav',X', 44100) %Genera un archivo de audio del ruido rosa.
end
