a = gameRoot.meters.Mstatus._currentframe * 10;
b = gameRoot.meters.Mrespect._currentframe;
c = int(gameRoot.player.damage);
bonus = gameRoot.bonusScore;
if(gameRoot.secret == true)
{
   d = "yes";
   secret = 1000;
}
else
{
   d = "no";
   secret = 0;
}
score = a * 10 + b * 10 + c * 10 + secret + gameRoot.bonusScore;
gameRoot.score = score;
a = a.toString() + "%";
b = b.toString() + "%";
c = c.toString() + "%";
