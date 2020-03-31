% Alejandro Jimenez Rocha - sai993

classdef Car < handle
    %A simple attempt to represent a car.
    properties
        %Initialize attributes to describe a car.
        xmake = "";
        ymodel = "";
        zyear = "";
        odometer_reading = 0;
    end
    
    methods (Static)
        
        function c = Car(make, model, year)
            c.xmake = make;
            c.ymodel = model;
            c.zyear = year;
            c.odometer_reading = 0;
        end
        
        function get_descriptive_name(c)
            %Return a neatly formatted descriptive name.
            long_name = c.zyear + " " + c.xmake + " " + c.ymodel;
            disp(long_name);
        end
        
        function read_odometer(c)
            %Print a statement showing the car's mileage.
            disp("This car has " + c.odometer_reading + " miles on it.")
        end
        
        function update_odometer(c, mileage)
            %Set the odometer reading to the given value.
            %Reject the change if it attempts to roll the odometer back.
            if mileage >= c.odometer_reading
                c.odometer_reading = mileage;
            else
                disp("You can't roll back an odometer!");
            end
        end
        
        function increment_odometer(c, miles) 
            %Add the given amount to the odometer reading.
            c.odometer_reading = c.odometer_reading + miles;
        end
    end
end

