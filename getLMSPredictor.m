function [ Xest,Xerr] = getLMSPredictor(Xrec)
% Xrec : the input signal
% Xest : the predicted signal
% Xerr : prediction error
    N = length(Xrec);
    a = 0.953125; 
    b = 0.953125;
    u = 0.90625;
    r0 = 0;
    r1 = 0;
    COR0 = zeros(1,N);
    COR1 = zeros(1,N);
    VAR0 = ones(1,N);
    VAR1 = ones(1,N);
    e0 = zeros(1,N);
    e1 = zeros(1,N);
    Xerr = zeros(1,N);
    for n = 2:N
        K1(n) = b*COR0(n-1)/VAR0(n-1);
        K2(n) = b*COR1(n-1)/VAR1(n-1);
        Xest(n) =  K1(n)*r0(n-1) + K2(n)*r1(n-1);
        % update coefficients
        e0(n) = Xrec(n);
        e1(n) = e0(n) - K1(n)*r0(n-1);
        VAR0(n) = u*VAR0(n-1) + 0.5*[r0(n-1)^2+e0(n)^2];
        COR0(n) = u*COR0(n-1) + r0(n-1)*e0(n);
        VAR1(n) = u*VAR1(n-1) + 0.5*[r1(n-1)^2+e1(n)^2];
        COR1(n) = u*COR1(n-1) + r1(n-1)*e1(n);
        r1(n) = a*(r0(n-1)-K1(n)*e0(n));
        r0(n) = a*e0(n);
        Xerr(n) = Xrec(n) - Xest(n);
    end
end

