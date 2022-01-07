gameRoot.fadeClip.gotoAndStop("wellDone");
var resp = gameRoot.meters.Mrespect._currentframe + 2;
if(resp > 100)
{
   resp = 100;
}
gameRoot.meters.Mrespect.gotoAndStop(resp);
gameRoot.kompas.signal.gotoAndPlay("yellow");
car.deuren.d4.gotoAndPlay("close");
