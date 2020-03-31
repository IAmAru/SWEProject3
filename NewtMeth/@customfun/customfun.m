% Alejandro Jimenez Rocha - sai993

classdef customfun < handle
    properties
        %Initial parameters.
        Fu = [];
        dFu = [];
        x0 = [];
        NumIt = 0;
        epsval = 0;
        p = ""
    end
    methods (Static)
        function NewtMeth = customfun(varargin)
            NewtMeth.Fu = varargin{1};
            NewtMeth.p = poly2sym(NewtMeth.Fu);
        end
        
        function read_function(NewtMeth)
            disp(NewtMeth.Fu);
        end
        
        function ZNewtCalc(NewtMeth, x0, NumIt, epsval)
            sumv = complex(0, 0); %Initializing various variables.
            xn = x0;
            ff = NewtMeth.Fu; %Redundant to an extent...
            fprime = polyder(ff); %Using polyder, thanks to finding Docs.

            for x = 0:NumIt
                evaluated_poly = polyval(ff, xn); %Evaluating the Polynomial at x_n.
                evaluated_der = polyval(fprime, xn); %Evaluating the derivative of the polynomial at x_n.
                sumv = sumv - (evaluated_poly/evaluated_der);
                
                xold = xn;
                xn = sumv;
                
                if abs(xn-xold) < epsval
                    % I don't particularly like disp. It feels clunky.
                    disp("The root calculator convergence was a success!");
                    disp("The found root for the function");
                    disp(NewtMeth.p);
                    disp("was:");
                    disp(xn);
                    break;
                end
                if x == NumIt
                    disp("No way man!");
                    disp("The root calculator convergence to");
                    disp(NewtMeth.p);
                    disp("is inaccurate!");
                end
            end
            
        end
    end
end