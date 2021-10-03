package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1078:int = -1;
      
      private static const const_788:int = 20;
      
      private static const const_520:int = 9;
       
      
      private var var_657:Boolean = false;
      
      private var var_226:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_226 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_657)
            {
               var_657 = true;
               var_226 = new Array();
               var_226.push(const_1078);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_657)
            {
               var_657 = false;
               var_226 = new Array();
               var_226.push(const_788);
               var_226.push(const_520 + param1);
               var_226.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
