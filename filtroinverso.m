function filtroinverso(w1,w2,T);
t=0:1/1000:T;
K=(T*w1)/(log(w2/w1));
L=T/(log(w2/w1));
X_t=sin(K*(exp(t/L)-1));
[n m] = size(X_t);
a = (w1/(2*pi))*ones(n,m);
W= (K/L)*exp(t/L);
M= a./W;
K_t= M.*X_t;
plot(t,K_t,'b')
audiowrite('filtroinverso.wav',K_t, 44100)
end