% Alejandro Jimenez Rocha - sai993

%Firstly, I give the user a choice whether to use the built-in roots
%function or to use my custom function.

user_choice = "customfun";
%Where the string should represent the choice between 
%"customfun" and "matlabfun".

polynomial = [3 0 0 1];
%For the sake of the example and simplicity, I chose to use x^3 + 1, which
%was the function provided in the original Python script.

if user_choice == "matlabfun"
    MLF_roots = roots(polynomial);
    disp("The roots to the polynomial, using matlabfun, are:");
    disp(MLF_roots);
end

if user_choice == "customfun"
    
    % x0 is the initial guess which was given in the original script.
    % In this case we're estimating the root to be somewhere close to
    % -2 + 2i, but with any other function that doesn't require complex
    % roots (such as x^2 - 1 where the root is just 1), the complex() isn't
    % particularly needed. In fact, it'd give a slightly redundant result,
    % where the answer would be 1 + 0i.
    
    x0 = complex(-2, 2); 
    poly = customfun(polynomial); % Creating the object.
    customfun.ZNewtCalc(poly, x0, 7, 0.01); %Running the calculation!
end