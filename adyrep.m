function adyrep(t,x,w1,w2);   
 %Funcion que reproduce y graba una señal de audio de manera simultanea para
 %un tiempo determinado t en segundos.
 %Dependiendo de que senñal quiera introducir debera elegir los siguientes
 %valores de x:
 %Para x = 1 la senal sera la del RuidoRosa
 %Para x = 2 la senal sera la del Sine Sweep
 %Para x = 3 la senal sera la del filtro Inverso
 %w1 y w2 son las frecuencias angulares inferior y superior resectivamente
 %para las funciones Sine Sweep y Filtro Inverso.
    T = t/100;
    if x == 1
        RuidoRosa(t);
        [y, Fs] = audioread('RuidoRosa.wav');
    elseif x == 2
        SineSweep(T,w1,w2)
        [y, Fs] = audioread('sinesweep.wav');
    elseif x == 3
        filtroinverso(w1,w2,T)
        [y, Fs] = audioread('filtroinverso.wav');
    else
        fprintf('Numero invalido.\n')
        return
    end
    sound(y,Fs)
    recObj = audiorecorder(44100,8,1);
    disp('Grabacion en curso.'); 
    recordblocking(recObj, t); 
    disp('Fin de la grabacion.');
    k = getaudiodata(recObj);
    plot(k);
end