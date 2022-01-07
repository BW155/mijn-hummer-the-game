gameRoot.groenePruikCount = gameRoot.groenePruikCount + 1;
if(gameRoot.groenePruikCount >= 20 && gameRoot.secret == false)
{
   gameRoot.secret = true;
   gameRoot.meters.secretFound.gotoAndPlay("open");
   gameRoot.kompas.signal.gotoAndPlay("green");
}
