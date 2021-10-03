package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_822:int = 2;
      
      private static const const_1132:Array = [0,0,0];
       
      
      private var var_432:String;
      
      private const const_1467:int = 1;
      
      private var var_454:String = "";
      
      private var var_768:int = 0;
      
      private var _isDisposed:Boolean = false;
      
      private var var_1920:int = 0;
      
      private var var_1358:String = "";
      
      private var var_2174:Boolean = false;
      
      private var var_425:Boolean;
      
      private const const_1133:int = 3;
      
      private var var_1591:String = "";
      
      private var var_66:IAvatarImage = null;
      
      private var var_767:int = 0;
      
      private const const_1739:int = 3;
      
      private var var_1390:int = -1;
      
      private var var_1359:Boolean = false;
      
      private var var_1626:int = -1;
      
      private var var_672:int = 0;
      
      private var var_2404:Array;
      
      private const const_1152:int = 0;
      
      private var var_1395:Boolean = false;
      
      private var var_1628:int = -1;
      
      private var var_372:ExperienceData;
      
      private var var_1590:Number = NaN;
      
      private var var_958:Boolean = false;
      
      private var var_1396:Boolean = false;
      
      private var var_324:BitmapDataAsset;
      
      private const const_1474:int = 2;
      
      private var var_1104:int = 0;
      
      private var var_782:PetVisualizationData = null;
      
      private var var_537:Map;
      
      private var var_1357:Boolean = false;
      
      public function PetVisualization()
      {
         super();
         var_2404 = new Array();
         var_537 = new Map();
         var_425 = false;
      }
      
      public function imageReady() : void
      {
         var_1359 = true;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_478,var_454,var_1591);
         if(var_1358 != null && var_1358 != "")
         {
            param1.appendAction(AvatarAction.const_272,var_1358);
         }
         if(var_2174 || var_1396)
         {
            param1.appendAction(AvatarAction.const_500);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + const_1133;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         var_1357 = false;
         switch(var_454)
         {
            case AvatarAction.const_672:
            case AvatarAction.const_879:
            case AvatarAction.const_1047:
            case AvatarAction.const_924:
            case AvatarAction.const_985:
            case AvatarAction.const_856:
            case AvatarAction.const_709:
            case AvatarAction.const_254:
            case AvatarAction.const_264:
               var_1357 = true;
         }
         var_1395 = false;
         var_958 = false;
         if(var_454 == "lay")
         {
            var_958 = true;
            _loc1_ = int(var_1591);
            if(_loc1_ < 0)
            {
               var_1395 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_537)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_537.reset();
         var_66 = null;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_782 = param1 as PetVisualizationData;
         createSprites(const_1133);
         var_372 = new ExperienceData(var_782);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_537 != null)
         {
            _loc1_ = var_537.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_537.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         var_537.dispose();
         if(var_372)
         {
            var_372.dispose();
         }
         var_372 = null;
         var_782 = null;
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(const_1467);
         var_324 = null;
         _loc2_ = getSprite(const_1467);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            var_324 = var_66.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            var_324 = var_66.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(var_324)
         {
            _loc2_.asset = var_324.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_537.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = var_782.getAvatar(var_432,param1,this);
            if(_loc3_ != null)
            {
               var_537.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_168)
         {
            var_2174 = param1.getNumber(RoomObjectVariableEnum.const_446) > 0;
            var_1358 = param1.getString(RoomObjectVariableEnum.const_281);
            var_454 = param1.getString(RoomObjectVariableEnum.const_377);
            var_1591 = param1.getString(RoomObjectVariableEnum.const_694);
            var_1590 = param1.getNumber(RoomObjectVariableEnum.const_305);
            var_1104 = param1.getNumber(RoomObjectVariableEnum.const_857);
            var_1920 = param1.getNumber(RoomObjectVariableEnum.const_935);
            validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_162);
            if(var_432 != _loc3_)
            {
               var_432 = _loc3_;
               resetAvatarImages();
            }
            var_168 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_782 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         if(var_1359)
         {
            var_1359 = false;
            var_768 = 0;
            var_767 = 1;
            resetAvatarImages();
         }
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc8_ || _loc5_ != var_151 || var_66 == null)
         {
            if(_loc5_ != var_151)
            {
               var_151 = _loc5_;
               _loc6_ = true;
            }
            if(_loc6_ || var_66 == null)
            {
               var_66 = getAvatarImage(_loc5_);
            }
            if(var_66 == null)
            {
               return;
            }
            if(_loc6_)
            {
               updateShadow(_loc5_);
            }
            _loc7_ = updateObject(_loc3_,param1,true);
            updateActions(var_66);
         }
         else
         {
            _loc7_ = updateObject(_loc3_,param1);
         }
         var _loc9_:Boolean = _loc7_ || _loc8_ || _loc6_;
         var _loc10_:Boolean = var_425 || var_767 > 0 || var_1357;
         var_372.alpha = 0;
         if(var_1104 > 0)
         {
            _loc11_ = param2 - var_1104;
            if(_loc11_ < AvatarAction.const_992)
            {
               var_372.alpha = int(Math.sin(_loc11_ / 0 * 0) * 255);
               var_372.setExperience(var_1920);
               var_767 = const_1739;
            }
            else
            {
               var_1104 = 0;
            }
            _loc12_ = getSprite(const_1474);
            if(_loc12_ != null)
            {
               if(false)
               {
                  _loc12_.asset = var_372.image;
                  _loc12_.offsetX = -20;
                  _loc12_.offsetY = -80;
                  _loc12_.alpha = var_372.alpha;
                  _loc12_.visible = true;
               }
               else
               {
                  _loc12_.asset = null;
                  _loc12_.visible = false;
               }
            }
         }
         if(_loc9_ || _loc10_)
         {
            increaseUpdateId();
            --var_767;
            ++var_672;
            --var_768;
            if(!(var_768 <= 0 || _loc6_))
            {
               return;
            }
            var_66.updateAnimationByFrames(1);
            var_768 = const_822;
            var_425 = var_66.isAnimating();
            _loc13_ = var_66.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1132;
            }
            _loc14_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc14_ = Math.min(_loc5_ / 2.75,0);
            }
            _loc12_ = getSprite(const_1152);
            if(_loc12_)
            {
               _loc17_ = var_66.getImage(AvatarSetType.const_38,false);
               if(_loc17_ != null)
               {
                  _loc12_.asset = _loc17_;
               }
               if(_loc5_ < 48)
               {
                  _loc12_.offsetX = -16 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + 8 + _loc13_[1] + _loc14_;
               }
               else
               {
                  _loc12_.offsetX = -32 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + 16 + _loc13_[1] + _loc14_;
               }
            }
            _loc15_ = const_1133;
            for each(_loc16_ in var_66.getSprites())
            {
               _loc12_ = getSprite(_loc15_);
               if(_loc12_ != null)
               {
                  _loc18_ = var_66.getLayerData(_loc16_);
                  _loc19_ = 0;
                  _loc20_ = _loc16_.getDirectionOffsetX(var_66.getDirection());
                  _loc21_ = _loc16_.getDirectionOffsetY(var_66.getDirection());
                  _loc22_ = _loc16_.getDirectionOffsetZ(var_66.getDirection());
                  _loc23_ = 0;
                  if(_loc16_.hasDirections)
                  {
                     _loc23_ = var_66.getDirection();
                  }
                  if(_loc18_ != null)
                  {
                     _loc19_ = _loc18_.animationFrame;
                     _loc20_ += _loc18_.dx;
                     _loc21_ += _loc18_.dy;
                     _loc23_ += _loc18_.directionOffset;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc20_ /= 2;
                     _loc21_ /= 2;
                  }
                  if(_loc23_ < 0)
                  {
                     _loc23_ += 8;
                  }
                  if(_loc23_ > 7)
                  {
                     _loc23_ -= 8;
                  }
                  _loc24_ = var_66.getScale() + "_" + _loc16_.member + "_" + _loc23_ + "_" + _loc19_;
                  _loc25_ = var_66.getAsset(_loc24_);
                  if(_loc25_ != null)
                  {
                     _loc12_.asset = _loc25_.content as BitmapData;
                     _loc12_.offsetX = -1 * _loc25_.offset.x - _loc5_ / 2 + _loc20_;
                     _loc12_.offsetY = -1 * _loc25_.offset.y + _loc21_;
                     _loc12_.relativeDepth = -0.01 - 0.1 * _loc15_ * _loc22_;
                     if(_loc16_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                     _loc15_++;
                  }
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_293 != param1.getUpdateID() || var_1390 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1590;
            if(isNaN(var_1590))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != var_1626 || param3)
            {
               var_1626 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_66.setDirectionAngle(AvatarSetType.const_38,_loc4_);
            }
            if(_loc5_ != var_1628 || param3)
            {
               var_1628 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               var_66.setDirectionAngle(AvatarSetType.const_47,_loc5_);
            }
            var_293 = param1.getUpdateID();
            var_1390 = param2.updateId;
            return true;
         }
         return false;
      }
   }
}
