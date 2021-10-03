package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_404:FloorRasterizer;
      
      private var var_895:Boolean = false;
      
      private var var_584:PlaneMaskManager;
      
      private var var_405:WallRasterizer;
      
      private var var_583:WallAdRasterizer;
      
      private var var_406:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_405 = new WallRasterizer();
         var_404 = new FloorRasterizer();
         var_583 = new WallAdRasterizer();
         var_406 = new LandscapeRasterizer();
         var_584 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_405;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_583;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_404;
      }
      
      public function get initialized() : Boolean
      {
         return var_895;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_584;
      }
      
      public function dispose() : void
      {
         if(var_405 != null)
         {
            var_405.dispose();
            var_405 = null;
         }
         if(var_404 != null)
         {
            var_404.dispose();
            var_404 = null;
         }
         if(var_583 != null)
         {
            var_583.dispose();
            var_583 = null;
         }
         if(var_406 != null)
         {
            var_406.dispose();
            var_406 = null;
         }
         if(var_584 != null)
         {
            var_584.dispose();
            var_584 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_405.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_404.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_583.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_406.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_584.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_405 != null)
         {
            var_405.clearCache();
         }
         if(var_404 != null)
         {
            var_404.clearCache();
         }
         if(var_406 != null)
         {
            var_406.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_406;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_895)
         {
            return;
         }
         var_405.initializeAssetCollection(param1);
         var_404.initializeAssetCollection(param1);
         var_583.initializeAssetCollection(param1);
         var_406.initializeAssetCollection(param1);
         var_584.initializeAssetCollection(param1);
         var_895 = true;
      }
   }
}
