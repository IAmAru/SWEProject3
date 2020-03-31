%Alejandro Jimenez Rocha - sai993

classdef GP2 < handle
    properties (Access = ?BasebandGen)
        xaxis='Index';
        yaxis='Output';
        ztitle='Output'; 
        %As a precaution, I just put these as a default; though I doubt
        %they'll come in handy.
    end

    methods
        
        function GoodPlot2 = GP2(ztitle, xaxis, yaxis, plottype, figurenum, obj)
            %To be able to replace the values already in GP2.
            GoodPlot2.ztitle=ztitle;
            GoodPlot2.xaxis=xaxis;
            GoodPlot2.yaxis=yaxis;
            GoodPlot2.yaxis=plottype;
            GoodPlot2.yaxis=figurenum;
            
            %Compares between all three possibilities, to know what to
            %display in the end.
            if plottype == "freq"
                fs=20e3; % Didn't know where else to put this.
                
                %The rest of the code in this if statement is just straight
                %out of GoodPlotFreq.m, so there's nothing interesting.
                figure(figurenum);
                datafreq=20*log10(abs(fft(obj.y, obj.NFREQ)));
                xdataval=[0:obj.NFREQ-1]*(fs/obj.NFREQ);
                xdataval2=xdataval-fs/2;
                datafreq2=[datafreq(obj.NFREQ/2:end), datafreq(1:obj.NFREQ/2-1)];
                plot(xdataval2, datafreq2);
                xlabel(xaxis);
                ylabel(yaxis);
                title(ztitle);
            end
            
            %The following two are just from the original GoodPlot albeit
            %the subplot was replaced for a normal plot given we really
            %only need one at this point.
            
            if plottype == "real"  
                figure(figurenum);
                plot(real(obj.y));
                xlabel(xaxis);
                ylabel(yaxis);
                title(ztitle);
            end
            
            if plottype == "complex" 
                figure(figurenum);
                plot(imag(obj.y));
                xlabel(xaxis);
                ylabel(yaxis);
                title(ztitle);
            end
        end
    end
end