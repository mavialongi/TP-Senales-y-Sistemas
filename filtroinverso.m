function filtroinverso(w1,w2,T);
  %Filtro Inverso del Sine Sweep Logaritmico.
  %Definir el tiempo de duración T, la frecuencia angular inferior w1 y la
  %frecuecia angular superior w2.
    t=0:1/1000:T; %Vector de 0 a T a pasos de 1/1000 con el fin de obtener un resultado más continuo.
    K=(T*w1)/(log(w2/w1));
    L=T/(log(w2/w1));
    X_t=sin(K*(exp(t/L)-1)); %Ecuación del Sine Sweep Logaritmico.
    [n m] = size(X_t);
    a = (w1/(2*pi))*ones(n,m);
    W= (K/L)*exp(t/L); %Frecuencia instantanea.
    M= a./W; %Modulación para generar el filtro inverso del SineSweep Logaritmico.
    K_t= M.*X_t; %Ecuación del fltro inverso.
    audiowrite('filtroinverso.wav',K_t, 44100) %Genera un archivo de audio del Filltro inverso del Sine Sweep Logaritmico.
end
