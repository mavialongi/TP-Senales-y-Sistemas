function SineSweep(T,w1,w2);   
    %Sine Sweep Logaritmico. Generador de impulso por medio de convolución.
    %Definir el tiempo de duración T, la frecuencia angular inferior w1 y la
    %frecuecia angular superior w2.
    t = 0:1/1000:T; %Vector de 0 a T a pasos de 1/1000 con el fin de obtener un resultado más continuo.
    K = (T*w1)/(log(w2/w1));
    L = T/(log(w2/w1));
    x = sin(K*(exp(t/L)-1)); %Ecuación del Sine Sweep Logaritmico.
    audiowrite('SineSweep.wav',x',44100) %Genera un archivo de audio del Sine Sweep Logaritmico.  
end
