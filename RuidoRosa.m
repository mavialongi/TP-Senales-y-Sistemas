function RuidoRosa(t);
    Nx = t*44100;
    B = [0.049922035 -0.095993537 0.050612699 -0.004408786];
    A = [1 -2.494956002   2.017265875  -0.522189400];
    nT60 = round(log(1000)/(1-max(abs(roots(A)))));
    v = randn(1,Nx+nT60);
    x = filter(B,A,v);
    X = x(nT60+1:end);
    plot(1:length(X),X)
    audiowrite('Ruido_Rosa.wav',X', 44100)
end