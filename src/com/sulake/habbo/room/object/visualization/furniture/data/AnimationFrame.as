package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_752:int = -1;
      
      public static const const_894:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2197:int = -1;
      
      private var var_88:int = 0;
      
      private var var_1374:int = 1;
      
      private var var_938:int = 1;
      
      private var var_2199:Boolean = false;
      
      private var var_2198:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_2199 = param5;
         if(param4 < 0)
         {
            param4 = const_752;
         }
         var_938 = param4;
         var_1374 = param4;
         if(param6 >= 0)
         {
            var_2197 = param6;
            var_2198 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_938 > 0 && param1 > var_938)
         {
            param1 = var_938;
         }
         var_1374 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_938;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2198;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_938 < 0)
         {
            return const_752;
         }
         return var_1374;
      }
      
      public function get activeSequence() : int
      {
         return var_2197;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2199;
      }
      
      public function get x() : int
      {
         return var_88;
      }
   }
}
