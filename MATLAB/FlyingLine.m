classdef FlyingLine
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pointingDirection % In degrees
    end
    
    methods
        function obj = FlyingLine(initialInclination)
            %FlyingLine Construct an instance of this class
            
            % initialInclination in degrees
            obj.pointingDirection = [cos(deg2rad(initialInclination)); 0; sin(deg2rad(initialInclination))];
        end
        
        function obj = Pitch(obj,currentPitch)
            %addPitch Adds some pitch
            theta = deg2rad(currentPitch);
            pitchMatrix = [...
                [cos(theta), 0 ,-sin(theta)] ; ...
                [0, 1, 0] ; ...
                [sin(theta), 0, cos(theta)]
                ];
            obj.pointingDirection = pitchMatrix*obj.pointingDirection;
        end
        
        function [obj,h] = plotLine(obj, length)
            % The x-z coordinate of the head
            head = length/2*obj.pointingDirection;
            
            % The x-z coordinate of the tail
            tail = -length/2*obj.pointingDirection;
            
            h = plot([tail(1), head(1)], [tail(3), head(3)]);
            axis([-1.5*length, 1.5*length, -1.5*length, 1.5*length]);
        end
         
    end
end

