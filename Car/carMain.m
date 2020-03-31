% Alejandro Jimenez Rocha - sai993

%Here I create the initial object, c with the parameters I want:
% make, model, and year. 

c = Car("Subaru", "Outback", "2015");
Car.get_descriptive_name(c) %Using the object as an arg.

% Using args c, the object, and the new odometer reading (the update).
Car.update_odometer(c, 23500)
Car.read_odometer(c) %Again, using the object as an arg.

%Incrementing the odometer.
Car.increment_odometer(c, 100)
Car.read_odometer(c)


% From here, I'm going to be using the ElectricCar subclass.

%Creating an object once more.
my_tesla = ElectricCar("Tesla", "Model S", 2019);
ElectricCar.get_descriptive_name(my_tesla);

%For test purposes, I made -3 the odometer update, which rejects the
%update due to the default odometer value being 0. 0 > -3, leading to a
%rejection.

ElectricCar.update_odometer(my_tesla, -3);
ElectricCar.read_odometer(my_tesla);

ElectricCar.increment_odometer(my_tesla, 100);
ElectricCar.read_odometer(my_tesla);

% Using the function exclusive to ElectricCar.
ElectricCar.describe_battery(my_tesla);
