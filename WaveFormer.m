classdef WaveFormer
    %WaveFormer Creates two-dimensional time waveform out of resource matrix
    %   the length of waveform is (rMatrix width * rMatrix lenght
    methods(Static)
        function waveform = createWaveform(resource_Matrix)
            fLenght=length(resource_Matrix(:,1));
            waveform=reshape(ifft(resource_Matrix,fLenght,2).',1,[]);
        end
    end
end