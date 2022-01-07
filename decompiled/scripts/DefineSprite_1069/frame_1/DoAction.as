gotoAndStop(gameRoot.missionNr);
myVideo.contentPath = "movie/mission" + gameRoot.missionNr + ".flv";
myVideo.complete = function()
{
   _parent.gotoAndPlay("continue");
};
