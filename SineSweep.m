function SineSweep(T,w1,w2);   
    t = 0:1/1000:T;
    K = (T*w1)/(log(w2/w1));
    L = T/(log(w2/w1));
    x = sin(K*(exp(t/L)-1));
    audiowrite('SineSweep.wav',x',44100)   
end