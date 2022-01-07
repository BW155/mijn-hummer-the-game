if(_parent._parent.missionNr != 5)
{
   var resp = gameRoot.meters.Mrespect._currentframe + 4;
   if(resp > 100)
   {
      resp = 100;
   }
   gameRoot.meters.Mrespect.gotoAndStop(resp);
   gameRoot.kompas.signal.gotoAndPlay("yellow");
}
