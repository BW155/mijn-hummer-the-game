class FieldCheck
{
   var nameMsg1 = "Vul een naam in";
   var nameMsg2 = "Starten met een spatie is niet toegestaan";
   var nameMsg3 = "Meerdere spaties achter elkaar worden niet toegestaan";
   var nameMsg4 = "Speciale tekens worden in namen niet toegestaan";
   var emailMsg1 = "Vul een e-mail adres in";
   var emailMsg2 = "Een e-mail adres moet een @ bevatten";
   var emailMsg3 = "Een e-mail adres moet een punt bevatten";
   var emailMsg4 = "Vul een correcte url-extensie in";
   var emailMsg5 = "E-mail mag niet beginnen met een speciaal teken";
   var emailMsg6 = "E-mail mag geen dubbele tekens bevatten";
   var emailMsg7 = "Geen speciale tekens";
   var numberMsg1 = "Vul een getal in";
   var numberMsg2 = "Vul Alleen getallen in, geen andere tekens";
   function FieldCheck()
   {
   }
   function checkField(myField, fieldType)
   {
      this.error = false;
      this.txtField = myField;
      this.checkType = fieldType;
      this.checkInput();
      return this.error;
   }
   function checkInput()
   {
      switch(this.checkType)
      {
         case undefined:
            this.error = this.checkName();
            break;
         case 1:
            this.error = this.checkName();
            break;
         case 2:
            this.error = this.checkEmail();
            break;
         case 3:
            this.error = this.checkNumber();
            break;
         default:
            this.error = this.checkName();
      }
   }
   function checkName()
   {
      var _loc3_ = false;
      if(this.txtField.length < 1)
      {
         this.errorMsg = this.nameMsg1;
         _loc3_ = true;
         return _loc3_;
      }
      if(this.txtField.charCodeAt(0) == 32)
      {
         this.errorMsg = this.nameMsg2;
         _loc3_ = true;
         return _loc3_;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.txtField.length)
      {
         if(this.txtField.charCodeAt(_loc2_) >= 48 && this.txtField.charCodeAt(_loc2_) <= 57 || this.txtField.charCodeAt(_loc2_) >= 65 && this.txtField.charCodeAt(_loc2_) <= 90 || this.txtField.charCodeAt(_loc2_) >= 97 && this.txtField.charCodeAt(_loc2_) <= 122 || this.txtField.charCodeAt(_loc2_) == 32)
         {
            if(this.txtField.charCodeAt(_loc2_) == 32 && this.txtField.charCodeAt(_loc2_ + 1) == 32)
            {
               this.errorMsg = this.nameMsg3;
               _loc3_ = true;
               return _loc3_;
            }
            _loc2_ = _loc2_ + 1;
            continue;
         }
         this.errorMsg = this.nameMsg4;
         _loc3_ = true;
         return _loc3_;
      }
      return _loc3_;
   }
   function checkEmail()
   {
      var _loc3_ = false;
      var _loc7_ = " !,/?;:\'&^<>%$#*()+=|][}{~\"\\";
      var _loc6_ = " .-_@";
      var _loc8_ = undefined;
      if(this.txtField.length < 1)
      {
         this.errorMsg = this.emailMsg1;
         _loc3_ = true;
         return _loc3_;
      }
      if(this.txtField.indexOf("@") == -1)
      {
         this.errorMsg = this.emailMsg2;
         _loc3_ = true;
         return _loc3_;
      }
      _loc8_ = this.txtField.indexOf("@");
      var _loc10_ = this.txtField.substr(_loc8_);
      if(_loc10_.indexOf(".") == -1)
      {
         this.errorMsg = this.emailMsg3;
         _loc3_ = true;
         return _loc3_;
      }
      var _loc9_ = undefined;
      _loc9_ = _loc10_.substr(_loc10_.indexOf(".") + 1);
      if(_loc9_.length < 2 || _loc9_.indexOf(".") > -1 || _loc9_.indexOf("_") > -1 || _loc9_.indexOf("-") > -1 || _loc9_.indexOf(" ") > -1)
      {
         this.errorMsg = this.emailMsg4;
         _loc3_ = true;
         return _loc3_;
      }
      var _loc5_ = 0;
      while(_loc5_ < _loc6_.length)
      {
         if(this.txtField.charAt(0) == _loc6_.charAt(_loc5_))
         {
            this.errorMsg = this.emailMsg5;
            _loc3_ = true;
            return _loc3_;
         }
         var _loc2_ = 0;
         while(_loc2_ < this.txtField.length)
         {
            if(this.txtField.charAt(_loc2_) == _loc6_.charAt(_loc5_) && this.txtField.charAt(_loc2_ + 1) == _loc6_.charAt(_loc5_))
            {
               this.errorMsg = this.emailMsg6;
               _loc3_ = true;
               _loc5_ = _loc6_.length;
               return _loc3_;
            }
            if(this.txtField.charAt(_loc2_) == "@" && _loc2_ != _loc8_)
            {
               this.errorMsg = this.emailMsg6;
               _loc3_ = true;
               return _loc3_;
            }
            var _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               if(this.txtField.charAt(_loc2_) == _loc7_.charAt(_loc4_))
               {
                  this.errorMsg = this.emailMsg7;
                  _loc3_ = true;
                  _loc5_ = _loc6_.length;
                  _loc2_ = this.txtField.length;
                  return _loc3_;
               }
               _loc4_ = _loc4_ + 1;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      return _loc3_;
   }
   function checkNumber()
   {
      var _loc3_ = false;
      if(this.txtField.length < 1)
      {
         this.errorMsg = this.numberMsg1;
         _loc3_ = true;
         return _loc3_;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.txtField.length)
      {
         if(this.txtField.charCodeAt(_loc2_) < 48 || this.txtField.charCodeAt(_loc2_) > 57)
         {
            this.errorMsg = this.numberMsg2;
            _loc3_ = true;
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
}
