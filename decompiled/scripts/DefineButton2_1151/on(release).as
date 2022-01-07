on(release){
   var fieldType1 = 1;
   var fieldType2 = 2;
   var error = false;
   var i = 1;
   while(i <= 2)
   {
      var myField = this["veld" + i];
      var myType = this["fieldType" + i];
      error = gameRoot.inputController.checkField(myField.text,myType);
      if(error)
      {
         Selection.setFocus(myField);
         msg = gameRoot.inputController.errorMsg;
         break;
      }
      i++;
   }
   if(!error && !saving)
   {
      saving = true;
      protect._visible = true;
      getScoresAndSave(veld1.text,veld2.text);
   }
}
