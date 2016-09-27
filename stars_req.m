% Takes a rank and returns how many stars is required to reach the rank
function y = stars_req(x)
target_rank = x;
stars_req = 0;
while target_rank < 25
   if target_rank < 10
       stars_req = stars_req + 5;
   elseif target_rank < 15
       stars_req = stars_req + 4;
   elseif target_rank < 20
       stars_req = stars_req + 3;
   else
       stars_req = stars_req + 2;
   end
   target_rank = target_rank + 1;
end
y = stars_req;
end