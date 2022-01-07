var resp = gameRoot.meters.Mrespect._currentframe + 1;
if(resp > 100)
{
   resp = 100;
}
gameRoot.meters.Mrespect.gotoAndStop(resp);
gameRoot.kompas.signal.gotoAndPlay("yellow");
playSound("powerUp");
