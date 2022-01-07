onClipEvent(load){
   _parent._global.playSound = function(mySound)
   {
      if(_parent.soundSwitch)
      {
         if(!_parent.gamePauze)
         {
            _parent.soundBank.gotoAndPlay(mySound);
         }
      }
   };
   _parent._global.playMusic = function(mySound)
   {
      if(_parent.soundSwitch)
      {
         _parent.soundBank.gotoAndPlay(mySound);
      }
   };
   _visible = false;
}
