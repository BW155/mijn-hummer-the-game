delete this.onEnterFrame;
gameRoot.gamePauze = true;
gameRoot.player.speed = 0;
gameRoot.fadeClip.gotoAndStop("wellDone");
removeMovieClip(this);
