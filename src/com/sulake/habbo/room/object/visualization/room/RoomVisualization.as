package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomVisualization extends RoomObjectSpriteVisualization
   {
      
      public static const const_1275:int = 13421772;
      
      private static const const_803:int = 16777215;
      
      public static const const_1224:int = 10066329;
      
      private static const const_804:int = 13421772;
      
      public static const const_1235:int = 16777215;
      
      public static const const_1354:int = 16777215;
      
      private static const const_802:int = 10066329;
      
      private static const const_801:int = 10066329;
      
      public static const const_1327:int = 13421772;
       
      
      private var var_1540:int = 0;
      
      private var var_1331:String = null;
      
      private var var_2032:int = 255;
      
      private var var_312:Array;
      
      protected var _data:RoomVisualizationData = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1330:String = null;
      
      private var var_2033:int = -1000;
      
      private var var_1063:uint = 16777215;
      
      private var var_1541:Boolean = true;
      
      private var var_201:Array;
      
      private var var_1390:int = -1;
      
      private var var_103:Array;
      
      private var var_602:Rectangle = null;
      
      private var var_2037:int = 255;
      
      private var var_2034:Boolean = false;
      
      private var var_2036:int = 255;
      
      private var var_2030:String = null;
      
      private const const_1732:int = 250;
      
      private var var_83:RoomPlaneParser = null;
      
      private var var_2035:Number = 0.0;
      
      private var var_2031:Number = 0.0;
      
      private var var_311:Array;
      
      private var _floorType:String = null;
      
      private var var_424:RoomPlaneBitmapMaskParser = null;
      
      private var var_1124:Number = 0.0;
      
      private var var_2038:Number = 0.0;
      
      public function RoomVisualization()
      {
         var_103 = [];
         var_201 = [];
         var_311 = [];
         var_312 = [];
         super();
         _assetLibrary = new AssetLibrary("room visualization");
         var_83 = new RoomPlaneParser();
         var_424 = new RoomPlaneBitmapMaskParser();
         var_312["null"] = false;
         var_312["null"] = true;
         var_312["null"] = true;
         var_312["null"] = true;
      }
      
      private function getLandscapeHeight() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_83.planeCount)
         {
            _loc3_ = var_83.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_290)
            {
               _loc4_ = var_83.getPlaneRightSide(_loc2_);
               if(_loc4_.length > _loc1_)
               {
                  _loc1_ = Number(_loc4_.length);
               }
            }
            _loc2_++;
         }
         if(_loc1_ > 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is RoomVisualizationData))
         {
            return false;
         }
         _data = param1 as RoomVisualizationData;
         _data.initializeAssetCollection(assetCollection);
         return true;
      }
      
      protected function initializeRoomPlanes() : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         if(var_2034)
         {
            return;
         }
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.getModel().getString(RoomObjectVariableEnum.const_970);
         if(!var_83.initializeFromXML(new XML(_loc2_)))
         {
            return;
         }
         var _loc3_:Number = getLandscapeWidth();
         var _loc4_:Number = getLandscapeHeight();
         var _loc5_:* = 0;
         var _loc6_:int = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_946);
         var _loc7_:int = 0;
         while(_loc7_ < var_83.planeCount)
         {
            _loc8_ = var_83.getPlaneLocation(_loc7_);
            _loc9_ = var_83.getPlaneLeftSide(_loc7_);
            _loc10_ = var_83.getPlaneRightSide(_loc7_);
            _loc11_ = var_83.getPlaneSecondaryNormals(_loc7_);
            _loc12_ = var_83.getPlaneType(_loc7_);
            _loc13_ = null;
            if(!(_loc8_ != null && _loc9_ != null && _loc10_ != null))
            {
               return;
            }
            _loc14_ = Vector3d.crossProduct(_loc9_,_loc10_);
            _loc6_ = _loc6_ * 7613 + 517;
            _loc13_ = null;
            if(_loc12_ == RoomPlaneData.const_189)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_197,true,_loc11_,_loc6_);
               if(_loc14_.z != 0)
               {
                  _loc13_.color = const_1235;
               }
               else
               {
                  _loc13_.color = const_1275;
               }
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.floorRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_156)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_115,true,_loc11_,_loc6_);
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_loc14_.x == 0 && _loc14_.y == 0)
               {
                  _loc13_.color = const_801;
               }
               else if(_loc14_.y > 0)
               {
                  _loc13_.color = const_803;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_804;
               }
               else
               {
                  _loc13_.color = const_802;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.wallRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_290)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_91,true,_loc11_,_loc6_,_loc5_,0,_loc3_,_loc4_);
               if(_loc14_.y > 0)
               {
                  _loc13_.color = const_1354;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_1327;
               }
               else
               {
                  _loc13_.color = const_1224;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.landscapeRasterizer;
               }
               _loc5_ += _loc9_.length;
            }
            else if(_loc12_ == RoomPlaneData.const_1281)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_115,true,_loc11_,_loc6_);
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_loc14_.x == 0 && _loc14_.y == 0)
               {
                  _loc13_.color = const_801;
               }
               else if(_loc14_.y > 0)
               {
                  _loc13_.color = const_803;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_804;
               }
               else
               {
                  _loc13_.color = const_802;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.wallAdRasterizr;
               }
            }
            if(_loc13_ != null)
            {
               _loc13_.maskManager = _data.maskManager;
               _loc15_ = 0;
               while(_loc15_ < var_83.getPlaneMaskCount(_loc7_))
               {
                  _loc16_ = var_83.getPlaneMaskLeftSideLoc(_loc7_,_loc15_);
                  _loc17_ = var_83.getPlaneMaskRightSideLoc(_loc7_,_loc15_);
                  _loc18_ = var_83.getPlaneMaskLeftSideLength(_loc7_,_loc15_);
                  _loc19_ = var_83.getPlaneMaskRightSideLength(_loc7_,_loc15_);
                  _loc13_.addRectangleMask(_loc16_,_loc17_,_loc18_,_loc19_);
                  _loc15_++;
               }
               var_103.push(_loc13_);
            }
            _loc7_++;
         }
         var_2034 = true;
         defineSprites();
      }
      
      public function get planeCount() : int
      {
         return var_103.length;
      }
      
      private function updateMasksAndColors(param1:IRoomObjectModel) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:Boolean = false;
         var _loc2_:Boolean = false;
         if(var_168 != param1.getUpdateID())
         {
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_842);
            if(_loc3_ != var_2030)
            {
               updatePlaneMasks(_loc3_);
               var_2030 = _loc3_;
               _loc2_ = true;
            }
            _loc4_ = uint(param1.getNumber(RoomObjectVariableEnum.const_632));
            if(_loc4_ != var_1063)
            {
               var_1063 = _loc4_;
               var_2036 = var_1063 & 255;
               var_2037 = var_1063 >> 8 & 255;
               var_2032 = var_1063 >> 16 & 255;
               _loc2_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_832));
            if(_loc5_ != var_1541)
            {
               var_1541 = _loc5_;
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         super.dispose();
         if(_assetLibrary != null)
         {
            _loc1_ = 0;
            while(_loc1_ < _assetLibrary.numAssets)
            {
               _loc2_ = _assetLibrary.getAssetByIndex(_loc1_);
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_103 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < var_103.length)
            {
               _loc4_ = var_103[_loc3_] as RoomPlane;
               if(_loc4_ != null)
               {
                  _loc4_.dispose();
               }
               _loc3_++;
            }
            var_103 = null;
         }
         var_201 = null;
         var_311 = null;
         if(var_83 != null)
         {
            var_83.dispose();
            var_83 = null;
         }
         if(var_424 != null)
         {
            var_424.dispose();
            var_424 = null;
         }
         if(_data != null)
         {
            _data.clearCache();
            _data = null;
         }
      }
      
      protected function defineSprites() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         createSprites(_loc1_);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = var_103[_loc2_] as RoomPlane;
            _loc4_ = getSprite(_loc2_);
            if(_loc4_ != null && _loc3_ != null && _loc3_.leftSide != null && _loc3_.rightSide != null)
            {
               if(_loc3_.type == RoomPlane.const_115 && (_loc3_.leftSide.length < 1 || _loc3_.rightSide.length < 1))
               {
                  _loc4_.capturesMouse = false;
               }
               else
               {
                  _loc4_.capturesMouse = true;
               }
               _loc4_.tag = "plane@" + (_loc2_ + 1);
            }
            _loc2_++;
         }
      }
      
      public function get floorRelativeDepth() : Number
      {
         return 100.1;
      }
      
      public function get wallRelativeDepth() : Number
      {
         return 100.5;
      }
      
      override public function get boundingRectangle() : Rectangle
      {
         if(var_602 == null)
         {
            var_602 = super.boundingRectangle;
         }
         return new Rectangle(var_602.x,var_602.y,var_602.width,var_602.height);
      }
      
      protected function updatePlaneMasks(param1:String) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = XML(param1);
         var_424.initialize(_loc2_);
         var _loc3_:* = null;
         var _loc4_:* = [];
         var _loc5_:* = [];
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < var_103.length)
         {
            _loc3_ = var_103[_loc7_] as RoomPlane;
            if(_loc3_ != null)
            {
               _loc3_.resetBitmapMasks();
               if(_loc3_.type == RoomPlane.const_91)
               {
                  _loc4_.push(_loc7_);
               }
            }
            _loc7_++;
         }
         var _loc8_:int = 0;
         while(_loc8_ < var_424.maskCount)
         {
            _loc10_ = var_424.getMaskType(_loc8_);
            _loc11_ = var_424.getMaskLocation(_loc8_);
            _loc12_ = var_424.getMaskCategory(_loc8_);
            if(_loc11_ != null)
            {
               _loc13_ = 0;
               while(_loc13_ < var_103.length)
               {
                  _loc3_ = var_103[_loc13_] as RoomPlane;
                  if(_loc3_.type == RoomPlane.const_115 || _loc3_.type == RoomPlane.const_91)
                  {
                     if(_loc3_ != null && _loc3_.location != null && _loc3_.normal != null)
                     {
                        _loc14_ = Vector3d.dif(_loc11_,_loc3_.location);
                        _loc15_ = Math.abs(Vector3d.scalarProjection(_loc14_,_loc3_.normal));
                        if(_loc15_ < 0.01)
                        {
                           if(_loc3_.leftSide != null && _loc3_.rightSide != null)
                           {
                              _loc16_ = Vector3d.scalarProjection(_loc14_,_loc3_.leftSide);
                              _loc17_ = Vector3d.scalarProjection(_loc14_,_loc3_.rightSide);
                              if(_loc3_.type == RoomPlane.const_115 || _loc3_.type == RoomPlane.const_91 && _loc12_ == RoomPlaneBitmapMaskData.const_204)
                              {
                                 _loc3_.addBitmapMask(_loc10_,_loc16_,_loc17_);
                              }
                              else if(_loc3_.type == RoomPlane.const_91)
                              {
                                 if(!_loc3_.canBeVisible)
                                 {
                                    _loc6_ = true;
                                 }
                                 _loc3_.canBeVisible = true;
                                 _loc5_.push(_loc13_);
                              }
                           }
                        }
                     }
                  }
                  _loc13_++;
               }
            }
            _loc8_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_.length)
         {
            _loc18_ = _loc4_[_loc9_];
            if(_loc5_.indexOf(_loc18_) < 0)
            {
               _loc3_ = var_103[_loc18_] as RoomPlane;
               _loc3_.canBeVisible = false;
               _loc6_ = true;
            }
            _loc9_++;
         }
         if(_loc6_)
         {
            var_201 = [];
            var_311 = [];
         }
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:Boolean, param3:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         ++var_1540;
         if(param2)
         {
            var_201 = [];
            var_311 = [];
         }
         var _loc5_:int = param3;
         var _loc6_:Array = var_201;
         if(false)
         {
            _loc6_ = var_103;
         }
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc9_ = _loc8_;
            if(_loc7_)
            {
               _loc9_ = 0;
            }
            _loc10_ = getSprite(_loc9_);
            if(_loc10_ != null)
            {
               _loc11_ = _loc6_[_loc8_] as RoomPlane;
               if(_loc11_ != null)
               {
                  if(_loc11_.update(param1,_loc5_))
                  {
                     if(_loc11_.visible)
                     {
                        _loc12_ = _loc11_.relativeDepth + floorRelativeDepth + Number(_loc9_) / 1000;
                        if(_loc11_.type != RoomPlane.const_197)
                        {
                           _loc12_ = _loc11_.relativeDepth + wallRelativeDepth + Number(_loc9_) / 1000;
                        }
                        _loc13_ = "plane " + _loc9_ + " " + param1.scale;
                        updateSprite(_loc10_,_loc11_,_loc13_,_loc12_);
                     }
                  }
                  _loc10_.visible = _loc11_.visible && false;
                  if(_loc10_.visible)
                  {
                     if(!_loc7_)
                     {
                        var_201.push(_loc11_);
                        var_311.push(_loc8_);
                     }
                  }
               }
               else
               {
                  _loc10_.visible = false;
               }
            }
            _loc8_++;
         }
      }
      
      private function getLandscapeWidth() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_83.planeCount)
         {
            _loc3_ = var_83.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_290)
            {
               _loc4_ = var_83.getPlaneLeftSide(_loc2_);
               _loc1_ += _loc4_.length;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function updatePlaneTypeVisibilities(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 != var_312["null"] || param2 != var_312["null"] || param3 != var_312["null"])
         {
            var_312["null"] = param1;
            var_312["null"] = param2;
            var_312["null"] = param3;
            var_201 = [];
            var_311 = [];
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc4_:Boolean = updateGeometry(param1);
         var _loc5_:IRoomObjectModel = _loc3_.getModel();
         initializeRoomPlanes();
         var _loc6_:Boolean = updateMasksAndColors(_loc5_);
         var _loc7_:int = param2;
         if(_loc7_ < var_2033 + const_1732 && !_loc4_ && !_loc6_)
         {
            return;
         }
         updatePlaneTexturesAndVisibilities(_loc5_);
         updatePlanes(param1,_loc4_,param2);
         var _loc8_:int = 0;
         while(_loc8_ < var_201.length)
         {
            _loc9_ = 0;
            _loc10_ = getSprite(_loc9_);
            _loc11_ = var_201[_loc8_] as RoomPlane;
            if(_loc10_ != null && _loc11_ != null && _loc11_.type != RoomPlane.const_91)
            {
               if(var_1541)
               {
                  _loc12_ = uint(_loc11_.color);
                  _loc13_ = uint((_loc12_ & 255) * var_2036 / 255);
                  _loc14_ = uint((_loc12_ >> 8 & 255) * var_2037 / 255);
                  _loc15_ = uint((_loc12_ >> 16 & 255) * var_2032 / 255);
                  _loc16_ = uint(_loc12_ >> 24);
                  _loc12_ = uint((_loc16_ << 24) + (_loc15_ << 16) + (_loc14_ << 8) + _loc13_);
                  _loc10_.color = _loc12_;
               }
               else
               {
                  _loc10_.color = _loc11_.color;
               }
            }
            _loc8_++;
         }
         increaseUpdateId();
         var_168 = _loc5_.getUpdateID();
         var_2033 = _loc7_;
      }
      
      public function get wallAdRelativeDepth() : Number
      {
         return 100.49;
      }
      
      protected function updatePlaneTextureTypes(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc5_:* = null;
         if(param1 != _floorType)
         {
            _floorType = param1;
         }
         else
         {
            param1 = null;
         }
         if(param2 != var_1331)
         {
            var_1331 = param2;
         }
         else
         {
            param2 = null;
         }
         if(param3 != var_1330)
         {
            var_1330 = param3;
         }
         else
         {
            param3 = null;
         }
         if(param1 == null && param2 == null && param3 == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_103.length)
         {
            _loc5_ = var_103[_loc4_] as RoomPlane;
            if(_loc5_ != null)
            {
               if(_loc5_.type == RoomPlane.const_197 && param1 != null)
               {
                  _loc5_.id = param1;
               }
               else if(_loc5_.type == RoomPlane.const_115 && param2 != null)
               {
                  _loc5_.id = param2;
               }
               else if(_loc5_.type == RoomPlane.const_91 && param3 != null)
               {
                  _loc5_.id = param3;
               }
            }
            _loc4_++;
         }
         return true;
      }
      
      private function updateGeometry(param1:IRoomGeometry) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = false;
         if(param1.updateId != var_1390)
         {
            var_1390 = param1.updateId;
            var_602 = null;
            _loc3_ = param1.direction;
            if(_loc3_ != null && (_loc3_.x != var_1124 || _loc3_.y != var_2035 || _loc3_.z != var_2031 || param1.scale != var_2038))
            {
               var_1124 = _loc3_.x;
               var_2035 = _loc3_.y;
               var_2031 = _loc3_.z;
               var_2038 = param1.scale;
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      private function updatePlaneTexturesAndVisibilities(param1:IRoomObjectModel) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         if(var_168 != param1.getUpdateID())
         {
            _loc2_ = param1.getString(RoomObjectVariableEnum.const_620);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_688);
            _loc4_ = param1.getString(RoomObjectVariableEnum.const_732);
            updatePlaneTextureTypes(_loc3_,_loc2_,_loc4_);
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_659));
            _loc6_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_536));
            _loc7_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_540));
            updatePlaneTypeVisibilities(_loc5_,_loc6_,_loc7_);
         }
      }
      
      private function updateSprite(param1:IRoomObjectSprite, param2:RoomPlane, param3:String, param4:Number) : void
      {
         var _loc5_:Point = param2.offset;
         param1.offsetX = -_loc5_.x;
         param1.offsetY = -_loc5_.y;
         param1.relativeDepth = param4;
         param1.color = param2.color;
         param1.asset = getPlaneBitmap(param2,param3);
         param1.assetName = param3 + "_" + var_1540;
      }
      
      private function getPlaneBitmap(param1:RoomPlane, param2:String) : BitmapData
      {
         var _loc3_:BitmapDataAsset = _assetLibrary.getAssetByName(param2) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            _loc3_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
            _assetLibrary.setAsset(param2,_loc3_);
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         var _loc5_:BitmapData = param1.copyBitmapData(_loc4_);
         if(_loc5_ == null)
         {
            _loc5_ = param1.bitmapData;
            if(_loc5_ != null)
            {
               if(_loc4_ != _loc5_)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.dispose();
                  }
                  _loc3_.setUnknownContent(_loc5_);
               }
            }
         }
         return _loc5_;
      }
   }
}
