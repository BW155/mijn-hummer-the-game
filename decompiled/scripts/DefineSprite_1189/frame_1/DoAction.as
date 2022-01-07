function getScores()
{
   var _loc2_ = "?rf=" + Math.floor(Math.random() * 100000);
   loadVariables(theUrl + "highscore.txt" + _loc2_,this);
   this.onEnterFrame = function()
   {
      if(txtLoaded == "ok")
      {
         delete this.onEnterFrame;
         txtLoaded = "notOk";
         init();
      }
   };
}
function init()
{
   theScore = gameRoot.score;
   totalPlayers = 10;
   createPlayerList();
   if(theScore < 0)
   {
      if(!Key.isDown(39))
      {
         createHighscoreList();
         gotoAndStop("list");
      }
      else
      {
         emailView = "Highscore e-mail list                  playCount: " + gameRoot.playCounter.newCount + "\n\n";
         var _loc2_ = 0;
         while(_loc2_ < totalPlayers)
         {
            emailView = emailView + (_loc2_ + 1 + ".   " + theEmails[_loc2_] + "     " + theNames[_loc2_] + "     " + theScores[_loc2_] + "\n");
            _loc2_ = _loc2_ + 1;
         }
      }
      return undefined;
   }
   if(theScore < playerL[playerL.length - 1][0])
   {
      _parent.gotoAndStop("credits");
   }
   else
   {
      gotoAndStop("input");
   }
}
function createPlayerList()
{
   txtNames = M_decrypt(txtNames);
   txtScores = M_decrypt(txtScores);
   txtEmails = M_decrypt(txtEmails);
   theNames = txtNames.split(",");
   theScores = txtScores.split(",");
   theEmails = txtEmails.split(",");
   playerL = new Array();
   var _loc1_ = 0;
   while(_loc1_ < totalPlayers)
   {
      playerL[_loc1_] = [theScores[_loc1_],theNames[_loc1_],theEmails[_loc1_]];
      _loc1_ = _loc1_ + 1;
   }
   playerL.sort(sortByScore);
}
function sortByScore(el1, el2)
{
   var _loc2_ = el1[0];
   var _loc1_ = el2[0];
   return _loc1_ - _loc2_;
}
function addToHighscores(myName, myEmail)
{
   var _loc2_ = totalPlayers;
   myEmail = myEmail.toLowerCase();
   myName;
   var _loc1_ = 0;
   while(_loc1_ < totalPlayers)
   {
      if(myEmail == playerL[_loc1_][2])
      {
         _loc2_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_ < totalPlayers && theScore > playerL[_loc2_][0])
   {
      playerL[_loc2_][0] = theScore;
   }
   else if(_loc2_ == totalPlayers)
   {
      if(theScore > playerL[totalPlayers - 1][0])
      {
         playerL[totalPlayers - 1][0] = theScore;
         playerL[totalPlayers - 1][1] = myName;
         playerL[totalPlayers - 1][2] = myEmail;
      }
   }
   playerL.sort(sortByScore);
   createHighscoreList();
}
function createHighscoreList()
{
   var _loc2_ = 0;
   while(_loc2_ < totalPlayers)
   {
      this["score" + _loc2_] = playerL[_loc2_][0];
      this["name" + _loc2_] = playerL[_loc2_][1];
      this["email" + _loc2_] = playerL[_loc2_][2];
      _loc2_ = _loc2_ + 1;
   }
}
function getScoresAndSave(myName, myEmail)
{
   var _loc2_ = "?rf=" + Math.floor(Math.random() * 100000);
   loadVariables(theUrl + "highscore.txt" + _loc2_,this);
   this.onEnterFrame = function()
   {
      if(txtLoaded == "ok")
      {
         delete this.onEnterFrame;
         txtLoaded = "notOk";
         createPlayerList();
         addToHighscores(myName,myEmail);
         saveToFile();
         msg = "bezig met verzenden...";
      }
   };
}
function saveToFile()
{
   var _loc3_ = new Array();
   var _loc4_ = new Array();
   var _loc5_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < totalPlayers)
   {
      _loc3_.push(playerL[_loc2_][0]);
      _loc4_.push(playerL[_loc2_][1]);
      _loc5_.push(playerL[_loc2_][2]);
      _loc2_ = _loc2_ + 1;
   }
   thetext = "txtNames=" + M_encrypt(_loc4_) + "&txtScores=" + M_encrypt(_loc3_) + "&txtEmails=" + M_encrypt(_loc5_) + "&txtLoaded=ok";
   textfilename = "highscore.txt";
   loadVariables(theUrl + "writetofile.php",this,"POST");
   writeStatus = "busy";
   this.onEnterFrame = function()
   {
      if(writeStatus == "done")
      {
         delete this.onEnterFrame;
         protect._visible = false;
         gotoAndStop("list");
      }
   };
}
function M_encrypt(txt)
{
   txt = String(txt);
   cTxt = "";
   a = random(94) + 32;
   cTxt = cTxt + a.toString(16);
   prevCharCode = a;
   i = 0;
   while(i < txt.length)
   {
      charCode = txt.charCodeAt(i);
      charCode = charCode + (prevCharCode + i % a);
      while(charCode > 126)
      {
         charCode = charCode - 94;
      }
      cTxt = cTxt + charCode.toString(16);
      prevCharCode = charCode;
      i++;
   }
   return cTxt;
}
function M_decrypt(cTxt)
{
   cTxt = String(cTxt);
   txt = "";
   a = parseInt(cTxt.substr(0,2),16);
   prevCharCode = a;
   i = 2;
   while(i < cTxt.length - 1)
   {
      charCode = parseInt(cTxt.substr(i,2),16);
      oldCharCode = charCode;
      charCode = charCode - (prevCharCode + (i / 2 - 1) % a);
      prevCharCode = oldCharCode;
      while(charCode < 32)
      {
         charCode = charCode + 94;
      }
      txt = txt + String.fromCharCode(charCode);
      i = i + 2;
   }
   return txt;
}
stop();
theUrl = "php/";
protect._visible = false;
getScores();
