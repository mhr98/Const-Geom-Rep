
% plot_const: Plot the constellation digram
%
% Inputs: 
%   - I_data: base 1 data
%   - Q_data: base 2 data
% Outputs:
%   - Signal constellation

function plot_const(I_data,Q_data)
    figure
    scatter(I_data, Q_data, 'LineWidth', 10);
    hold on; grid on; box on;
    set(gca,'fontsize',18);
    ylim([-2 2]);
    xlim([-2 2]);
end