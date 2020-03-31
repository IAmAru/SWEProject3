% Alejandro Jimenez Rocha - sai993

classdef ElectricCar < Car
    %Represent aspects of a car, specific to electric vehicles.
    properties
        battery_size = 75;
    end
    methods (Static)
        
        function c = Car(varargin)
            c.battery_size = 75;
        end
        function describe_battery(c)
            disp("This car has a " + c.battery_size + "-kWh battery.")
        end
        
    end
end