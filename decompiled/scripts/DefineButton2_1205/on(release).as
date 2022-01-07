on(release){
   if(onoffClip._currentframe == 1)
   {
      onoffClip.gotoAndStop(2);
      gameRoot.soundSwitch = false;
      gameRoot.voices = false;
      voiceOnClip._alpha = 40;
      stopAllSounds();
   }
   else
   {
      onoffClip.gotoAndStop(1);
      gameRoot.soundSwitch = true;
      voiceOnClip._alpha = 100;
      playMusic("titleTunePlay");
   }
}
