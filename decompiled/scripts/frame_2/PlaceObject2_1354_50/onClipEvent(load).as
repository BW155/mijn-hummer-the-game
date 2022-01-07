onClipEvent(load){
   _parent._global.playVoice = function(mySound)
   {
      if(_parent.soundSwitch && _parent.voice1._currentframe == 1 && _parent.voices)
      {
         if(!_parent.gamePauze)
         {
            _parent.voice1.gotoAndPlay(mySound);
         }
      }
   };
   _visible = false;
}
