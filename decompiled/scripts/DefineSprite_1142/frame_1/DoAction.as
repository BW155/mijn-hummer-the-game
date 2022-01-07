function checkInput()
{
   var fieldType1 = 1;
   var fieldType2 = 2;
   var error = false;
   var emailArray = new Array();
   var emptyCount = 0;
   var i = 1;
   while(i <= 5)
   {
      var myField = this["friend" + i];
      var myType = 2;
      if(myField.text.length > 0)
      {
         error = gameRoot.inputController.checkField(myField.text,myType);
         if(error)
         {
            Selection.setFocus(myField);
            msg2 = gameRoot.inputController.errorMsg;
            return undefined;
         }
         emailArray.push(myField.text);
         msg2 = "";
      }
      else
      {
         emptyCount++;
      }
      i++;
   }
   if(emptyCount < 5)
   {
      var i = 1;
      while(i <= 2)
      {
         var myField = this["veld" + i];
         var myType = eval("fieldType" + i);
         error = gameRoot.inputController.checkField(myField.text,myType);
         if(error)
         {
            Selection.setFocus(myField);
            msg1 = gameRoot.inputController.errorMsg;
            return undefined;
         }
         msg1 = "";
         i++;
      }
   }
   else
   {
      error = true;
      Selection.setFocus(friend1);
      msg2 = "vul een e-mail adres in";
   }
   if(!error && !saving)
   {
      saving = true;
      protect._visible = true;
      msg1 = "bezig met verzenden...";
      var i = 0;
      while(i < emailArray.length)
      {
         var toAdress = emailArray[i];
         var body = "";
         sendEmail("php/sendfriend.php",toAdress,veld1.text,veld2.text,"Ben jij een Predator? | Speel het spel",body);
         i++;
      }
   }
}
function sendEmail(url, toAdress, fromName, fromAdress, subject, body)
{
   resultVars = new LoadVars();
   resultVars.ignoreWhite = true;
   resultVars.onLoad = function(success)
   {
      if(success)
      {
         msg1 = "";
         protect._visible = false;
         gotoAndStop("thanks");
      }
   };
   userVars = new LoadVars();
   userVars.EmailTo = toAdress.toLowerCase();
   userVars.EmailSubject = subject;
   userVars.EmailNameFrom = fromName;
   userVars.EmailFrom = fromAdress.toLowerCase();
   userVars.EmailBody = body;
   userVars.sendAndLoad(url,resultVars,"POST");
}
stop();
saving = false;
Selection.setFocus(friend1);
protect.useHandCursor = false;
protect._visible = false;
i = 1;
while(i <= 5)
{
   this["friend" + i].tabIndex = i;
   i++;
}
veld1.tabIndex = 6;
veld2.tabIndex = 7;
