% This code shows and compares all the outputs received

% Configuration for Octave:
more off %turns pagination off

cdiff2Tr

% Inputs
mc = 100;
minf = 1;
flux = 5e-4;

% Characteristics for the mediums. They must be vectors
diffusionCoefficient = 1e-8; 
source = 10;

% last position that has temperature values
number_Temp = save_1(1)*numbers_1(1) + save_1(2)*numbers_1(3);

% last position that has heat flux values
number_Flux = number_Temp + save_1(3)*numbers_1(3);

% last position that contains points positions
number_Points = save_1(1)*numbers_1(1) + ( save_1(2) || save_1(3) )*numbers_1(3);

% first position that has the position at the interface
number_Points_Flux = save_1(1)*numbers_1(1) + 1;

figure_defined = 0;


for (i0 = 1:times_1(5))

time_Ana = i0*times_1(1);
disp([' '; 'Time ' num2str(time_Ana) 's (step ' num2str(i0) ')'; ' '])
temp_message = 'Errors and differences: ';

% Note that we inverted the x,y vectors so that we could use this function to solve
% the problem shown in the tutorial
[Ttemp, qxAnatemp, qyAnatemp] = D2_BHE_f(Points_Output_1(1:number_Points,2)',  ...
             Points_Output_1(1:number_Points,1)', 1e-3, 1e-3, time_Ana, ...
             flux, minf, mc, diffusionCoefficient, 1, 1, 0, 1e3, 1e3, 0, source, 50, 50, 2);
             
             if ( save_1(1) || save_1(2) )
              if (figure_defined == 0)
                figure;
                figure_Temp = gcf();
              end

             
             TotalDiff(1,i0) = sum(abs(Ttemp(1:number_Temp) - output_1(1:number_Temp, i0)'));
             MaxDiff(1,i0) = max(abs(Ttemp(1:number_Temp) - output_1(1:number_Temp, i0)'));
             meanDiff(1,i0) = TotalDiff(1,i0)/number_Temp;
             percentageError(1,i0) = sum(abs( 100*(Ttemp(1:number_Temp) - output_1(1:number_Temp, i0)')./Ttemp ));
             MaxPercentageError(1,i0) = max(abs( 100*(Ttemp(1:number_Temp) - output_1(1:number_Temp, i0)')./Ttemp ));
             meanPercentage(1,i0) = percentageError(1,i0)/number_Temp;
             
             temp_message = [temp_message; 'Scalar: ' ...
             'total difference ' num2str(TotalDiff(1,i0)) ...
             ' ; mean difference ' num2str(meanDiff(1,i0)) ' ;' ...
             ' maximum difference ' num2str(MaxDiff(1,i0))  ' ;' ...
             ' total percentage error ' num2str(percentageError(1,i0)) ...
             ' %; mean percentage error ' num2str(meanPercentage(1,i0)) ' %;' ...
             ' maximum percentage error ' num2str(MaxPercentageError(1,i0)) ' %;'];
             
             
             if (save_1(1))
             TotalDiff(2,i0) = sum(abs(Ttemp(1:numbers_1(1)) - output_1(1:numbers_1(1), i0)'));
             meanDiff(2,i0) = TotalDiff(2,i0)/numbers_1(1);
             MaxDiff(2,i0) = max(abs(Ttemp(1:numbers_1(1)) - output_1(1:numbers_1(1), i0)'));
             percentageError(2,i0) = sum(abs( 100*(Ttemp(1:numbers_1(1)) - output_1(1:numbers_1(1), i0)')./Ttemp(1:numbers_1(1)) ));
             MaxPercentageError(2,i0) = max(abs( 100*(Ttemp(1:numbers_1(1)) - output_1(1:numbers_1(1), i0)')./Ttemp(1:numbers_1(1)) ));
             meanPercentage(2,i0) = percentageError(2,i0)/numbers_1(1);
             
             temp_message = [ temp_message; 'Central node:' ...
             ' total difference ' num2str(TotalDiff(2,i0)) ...
             ' ; mean difference ' num2str(meanDiff(2,i0)) ' ;' ...
             ' maximum difference ' num2str(MaxDiff(2,i0)) ' ;' ...
             ' total percentage error ' num2str(percentageError(2,i0)) ...
             ' %; mean percentage error ' num2str(meanPercentage(2,i0)) ' %;' ...
             ' maximum percentage error ' num2str(MaxPercentageError(2,i0)) ' %;'];
             
             % plot central temperatures
             set(0,'CurrentFigure',figure_Temp)
             plot(Points_Output_1(1:numbers_1(1),1), Ttemp(1:numbers_1(1))', '*b')
             hold on 
             plot(Points_Output_1(1:numbers_1(1),1), output_1(1:numbers_1(1), i0), '*r')
             
             end
             
             
             if (save_1(2))
             
             TotalDiff(3,i0) = sum(abs(Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) - output_1((1 + numbers_1(1)*save_1(1) ):number_Temp, i0)'));
             MaxDiff(3,i0) = max(abs(Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) - output_1((1 + numbers_1(1)*save_1(1) ):number_Temp, i0)'));
             meanDiff(3,i0) = TotalDiff(3,i0)/numbers_1(3);
             percentageError(3,i0) = sum(abs( 100*(Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) - output_1((1 + numbers_1(1)*save_1(1) ):number_Temp, i0)')./Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) ));    
             MaxPercentageError(3,i0) = max(abs( 100*(Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) - output_1((1 + numbers_1(1)*save_1(1) ):number_Temp, i0)')./Ttemp( (1 + numbers_1(1)*save_1(1) ):number_Temp ) ));
             meanPercentage(3,i0) = percentageError(3,i0)/numbers_1(3);
             
             temp_message = [ temp_message; 'Between node:' ...
             ' total difference ' num2str(TotalDiff(3,i0)) ...
             ' ; mean difference ' num2str(meanDiff(3,i0)) ' ;' ...
             ' maximum difference ' num2str(MaxDiff(3,i0)) ' ;' ...
             ' total percentage error ' num2str(percentageError(3,i0)) ...
             ' %; mean percentage error ' num2str(meanPercentage(3,i0)) ' %;' ...
             ' maximum percentage error ' num2str(MaxPercentageError(3,i0)) ' %;'];
             
             set(0,'CurrentFigure',figure_Temp)
             plot(Points_Output_1((1 + numbers_1(1)*save_1(1) ):number_Temp,1), Ttemp((1 + numbers_1(1)*save_1(1) ):number_Temp)', 'ob')
             hold on 
             plot(Points_Output_1((1 + numbers_1(1)*save_1(1) ):number_Temp,1), output_1((1 + numbers_1(1)*save_1(1) ):number_Temp, i0), 'or')
             end
             
             hold off
             
             end
             
             
             
             if (save_1 (3))
             
             if (figure_defined == 0)
                figure;
                figure_Flux = gcf();
              end
              
              qxAnaProj = Points_Output_1( (number_Temp + 1):number_Flux, 2).*qxAnatemp(number_Points_Flux:number_Points)';
              qyAnaProj = Points_Output_1( (number_Temp + 1):number_Flux, 1).*qyAnatemp(number_Points_Flux:number_Points)';
              
              qAnaLTn = qxAnaProj + qyAnaProj;
             
             TotalDiffFlux(1,i0) = sum(abs(qAnaLTn - output_1((1 + number_Temp ):number_Flux, i0) ));
             MaxDiffFlux(1,i0) = max(abs( qAnaLTn - output_1((1 + number_Temp ):number_Flux, i0) ));
             meanDiffFlux(1,i0) = TotalDiffFlux(1,i0)/numbers_1(3);
             percentageErrorFlux(1,i0) = sum(abs( 100*( qAnaLTn - output_1((1 + number_Temp ):number_Flux, i0) )./qAnaLTn ));
             MaxPercentageErrorFlux(1,i0) = max(abs( 100*( qAnaLTn - output_1((1 + number_Temp ):number_Flux, i0) )./qAnaLTn ));
             meanPercentageFlux(1,i0) = percentageErrorFlux(1,i0)/numbers_1(3);
             
             temp_message = [temp_message
             'Flux:' ...
             ' total difference ' num2str(TotalDiffFlux(1,i0)) ...
             ' ; mean difference ' num2str(meanDiffFlux(1,i0)) ' ;' ...
             ' maximum difference ' num2str(MaxDiffFlux(1,i0)) ' ;' ...
             ' total percentage error ' num2str(percentageErrorFlux(1,i0)) ...
             ' %; mean percentage error ' num2str(meanPercentageFlux(1,i0)) ' %;' ...
             ' maximum percentage error ' num2str(MaxPercentageErrorFlux(1,i0)) ' %'];
             
             
             
             set(0,'CurrentFigure',figure_Flux);
             plot(Points_Output_1(number_Points_Flux:number_Points,1), qAnaLTn, '*b')
             hold on 
             plot(Points_Output_1(number_Points_Flux:number_Points,1), output_1((1 + number_Temp ):number_Flux, i0), '*r')
             
             plot(Points_Output_1(number_Points_Flux:number_Points,1), qAnaLTn - output_1((1 + number_Temp ):number_Flux, i0), '*g')
             hold off
             
             
             
             end
             
             disp(temp_message)

             fflush(stdout);
             pause(0.5)
             
             figure_defined = 1;
             
             
end
