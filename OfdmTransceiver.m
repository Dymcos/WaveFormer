classdef OfdmTransceiver
    methods(Static)
        function [waveform,symbs] = ResourceGrid2ComlexTime(resource_Matrix)
            % transforms RG to comlex signal in time domain
            % before using signal should be resampled
            % fLenght=length(resource_Matrix(:,1));
            symbs=ifft(resource_Matrix);
            waveform=reshape(symbs,1,[]);
            symbs=symbs.';
            % ifft works with comlumns
        end
        function resGrid = ComplexTime2ResourceGrid(samples,symb_length)
            % transforms matched complex signal in time domain to RG
            % starting at first sample of array
            samples=reshape(samples,symb_length,[]);
            resGrid=fft(samples,symb_length);
            % fft works with columns
        end
    end
end