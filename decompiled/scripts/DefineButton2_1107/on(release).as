on(release){
   if(_currentframe <= 175)
   {
      delete this.onEnterFrame;
      gotoAndStop("skipTekst");
      play();
   }
}
