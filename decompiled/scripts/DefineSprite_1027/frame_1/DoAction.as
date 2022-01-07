theUrl = "php/";
randomFile = "?rf=" + Math.floor(Math.random() * 100000);
myLoad = false;
newCount;
loadVariables(theUrl + "visitcount.txt" + randomFile,this);
this.onEnterFrame = function()
{
   if(myLoad == false)
   {
      if(txtLoaded == "ok")
      {
         myLoad = true;
         txtLoaded = "notOk";
         newCount = int(visitCount) + 1;
         thetext = "visitCount=" + newCount + "&txtLoaded=ok";
         textfilename = "visitcount.txt";
         loadVariables(theUrl + "writetofile.php",this,"POST");
         writeStatus = "busy";
      }
   }
   else if(writeStatus == "done")
   {
      delete this.onEnterFrame;
   }
};
