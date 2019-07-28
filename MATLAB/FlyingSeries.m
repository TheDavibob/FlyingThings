function [t, pointing_series, M] = FlyingSeries(initialInclination, pitch_series)
% FlyingSeries: a line begins with initial angle "initial", and updates by
% "pitch_series(idx)" at each timestep

t = 0:numel(pitch_series);

pointing_series = zeros(numel(t), 3);

line = FlyingLine(initialInclination);
pointing_series(1,:) = line.pointingDirection;

h = figure();

line.plotLine(1);
M(1) = getframe();

for idx = 1:numel(pitch_series)
    line = line.Pitch(pitch_series(idx));
    pointing_series(idx+1,:) = line.pointingDirection;
    line.plotLine(1);
    M(idx + 1) = getframe();
end
close(h);

end