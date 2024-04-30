classdef WaveFormer
    %WaveFormer Creates two-dimensional time waveform out of resource matrix
    %   the length of waveform is (rMatrix width * rMatrix lenght)

    properties
        resourceMatrix
        tLenght
        fLenght
    end

    methods
        function obj = WaveFormer(resource_Matrix)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.resourceMatrix = resource_Matrix;
            obj.tLenght = length(obj.resourceMatrix(1,:)); %rMatrix horizontal size
            obj.fLenght = length(obj.resourceMatrix(:,1)); %rMatrix vertical size
        end
        function waveform = createWaveform(obj)
            waveform = zeros(1,obj.tLenght*obj.fLenght);
            for k = 1:obj.tLenght
            waveform(1+(k-1)*obj.fLenght:k*obj.fLenght) = ifft(obj.resourceMatrix(:,k));
            end
        end
    end
end