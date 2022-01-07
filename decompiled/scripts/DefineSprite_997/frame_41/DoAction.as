if(gameRoot.missionNr == 6)
{
   playVoice("groenegek");
}
else if(gameRoot.missionNr == 2)
{
   playVoice("hehe");
}
else if(gameRoot.missionNr > 2)
{
   playVoice("bestemming" + (1 + random(8)));
}
