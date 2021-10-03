package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1095:int = 31;
      
      private static const const_1078:int = 32;
      
      private static const const_519:int = 30;
      
      private static const const_788:int = 20;
      
      private static const const_520:int = 10;
       
      
      private var var_657:Boolean = false;
      
      private var var_226:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_226 = new Array();
         super();
         super.setAnimation(const_519);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!var_657)
            {
               var_657 = true;
               var_226 = new Array();
               var_226.push(const_1095);
               var_226.push(const_1078);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_520)
         {
            if(var_657)
            {
               var_657 = false;
               var_226 = new Array();
               if(_direction == 2)
               {
                  var_226.push(const_788 + 5 - param1);
                  var_226.push(const_520 + 5 - param1);
               }
               else
               {
                  var_226.push(const_788 + param1);
                  var_226.push(const_520 + param1);
               }
               var_226.push(const_519);
               return;
            }
            super.setAnimation(const_519);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
         {
            if(false)
            {
               super.setAnimation(var_226.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
