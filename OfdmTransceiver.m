classdef OfdmTransceiver
    methods(Static)
        function waveform = ResourceGrid2ComlexTime(resource_Matrix)
            fLenght=length(resource_Matrix(:,1));
            waveform=reshape(ifft(resource_Matrix,fLenght),1,[]);
        end
        function resGrid=ComplexTime2ResourceGrid(samples,symb_length)
            samples=reshape(samples,symb_length,[]);
            resGrid=fft(samples,symb_length);
        end
    end
end