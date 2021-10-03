package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1104:int = 1;
      
      private static const const_1078:int = 3;
      
      private static const const_1103:int = 2;
      
      private static const const_1102:int = 15;
       
      
      private var var_877:int;
      
      private var var_226:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_226 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1103)
         {
            var_226 = new Array();
            var_226.push(const_1104);
            var_877 = const_1102;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_877 > 0)
         {
            --var_877;
         }
         if(var_877 == 0)
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
