% This script simulates how many wins it takes to reach a certain rank in
% Hearthstone

% This array will contain the avg amount of games needed for all ranks
STATS_ARRAY_ALL = zeros(1,26);
% Number of simulations per rank
TOTAL_SIMS = 10000;
% Win rate
win_rate = 0.53;

for n = 0:25
    % Stats array for current rank
    STATS_ARRAY = zeros(1, TOTAL_SIMS);
    i = 1;
    while i <= TOTAL_SIMS
        stars = 0;
        win_streak = 0;
        total_games = 0;
        total_wins = 0;

        TARGET_RANK = n;
        STAR_GOAL = stars_req(TARGET_RANK);

        while stars < STAR_GOAL
            total_games = total_games + 1;
            % Win
            if rand() <= win_rate
                total_wins = total_wins + 1;
                win_streak = win_streak + 1;
                % Win streak?
                if win_streak >= 3 & stars < 70
                    stars = stars + 2;
                else
                    stars = stars + 1;
                end
            % Lose
            else
                win_streak = 0;
                if stars > 0 & stars > 10
                    stars = stars - 1;
                end
            end
        end
        STATS_ARRAY(i) = total_games;
        i = i + 1;
    end
    disp(n);

    average = mean(STATS_ARRAY);
    STATS_ARRAY_ALL(n+1) = average;
end

%% Plot
x_axis = linspace(0,25,26);
plot(x_axis, STATS_ARRAY_ALL);
title('Hearthstone rank simulation');
set(gca, 'xdir', 'reverse');
xlabel('Rank');
ylabel('Number of games');
