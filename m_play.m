function [] = m_play(octave)

octave = [55 110 220 440 880];
for k = 1:length(octave)
    pause = 0;
    A(k) = octave(k);
    As(k) = octave(k).*2^(1/12);
    B(k) = octave(k).*2^(2/12);
    C(k) = octave(k).*2^(3/12);
    Cs(k) = octave(k).*2^(4/12);
    D(k) = octave(k).*2^(5/12);
    Ds(k) = octave(k).*2^(6/12);
    E(k) = octave(k).*2^(7/12);
    F(k) = octave(k).*2^(8/12);
    Fs(k) = octave(k).*2^(9/12);
    G(k) = octave(k).*2^(10/12);
    Gs(k) = octave(k).*2^(11/12);
end

%% Notes and Durations
Notes = [D(2) D(3) D(2) D(2) C(3) D(2) D(2) A(3) A(2) ...
         A(2) G(2) A(2) A(2) F(3) Fs(3) D(2)];
Times = [1/4  1/4  1/5  1/5  1/4  1/5   1/5 1/4  1/5 ...
         1/5  1/4  1/5  1/5  1/4  1/8   1/4];

%% Play the Song
playSong(Notes, Times);


end