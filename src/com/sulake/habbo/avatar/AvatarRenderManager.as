package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_797:String;
      
      private var var_28:CoreComponent;
      
      private var var_845:Array;
      
      private var var_708:PaletteManager;
      
      private var var_403:AssetAliasCollection;
      
      private var var_351:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_195:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_195 = new Map();
         param2 |= const_909;
         super(param1,param2,param3);
         var_797 = RenderMode.const_1393;
         if(param1 is CoreComponent)
         {
            var_28 = CoreComponent(param1);
            var_28.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         var_845 = [];
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_195.getValue(AvatarType.const_100) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
         _loc2_ = var_195.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
      }
      
      public function createPetImageFromFigure(param1:String, param2:String, param3:IAvatarImageListener = null) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc4_:Array = param1.split(" ");
         if(_loc4_.length == 0)
         {
            return null;
         }
         var _loc5_:int = int(_loc4_[0]);
         var _loc6_:int = int(_loc4_[1]);
         var _loc7_:uint = parseInt(_loc4_[2],16);
         return createPetImage(_loc5_,_loc6_,_loc7_,param2,param3);
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      private function init() : void
      {
         var _loc3_:* = null;
         var _loc1_:AssetLibraryCollection = var_28.assets as AssetLibraryCollection;
         var_403 = new AssetAliasCollection(_loc1_);
         var_351 = new PetDataManager(_loc1_,this);
         var_708 = new PaletteManager(_loc1_);
         var _loc2_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_351.populateFigureData(_loc2_);
         _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.const_100);
         _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_195.add(AvatarType.const_100,_loc3_);
         _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
         _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_195.add(AvatarType.PET,_loc3_);
      }
      
      public function set mode(param1:String) : void
      {
         var_797 = param1;
         if(var_797 == RenderMode.const_1339)
         {
            init();
         }
         if(var_797 == RenderMode.const_1287)
         {
            init();
            onConfigurationInit(null);
         }
      }
      
      public function createPetImage(param1:int, param2:int, param3:uint, param4:String, param5:IAvatarImageListener = null) : IAvatarImage
      {
         var _loc6_:* = !var_351.assetsReady(param1);
         var _loc7_:String = var_351.createPetFigureString(param1,param2,param3);
         var _loc8_:AvatarStructure = var_195.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc8_ == null)
         {
            return null;
         }
         if(!_loc6_)
         {
            return new PetImage(_loc8_,var_403,_loc7_,param4);
         }
         if(param5 != null)
         {
            var_845.push(param5);
         }
         return new TemporaryPetImage(_loc8_,var_403,_loc7_,param4,_assets);
      }
      
      public function resetPetData() : void
      {
         var _loc3_:* = null;
         var_403.init();
         var_351.init();
         var_708.init();
         var _loc1_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_351.populateFigureData(_loc1_);
         var _loc2_:AvatarStructure = var_195.getValue(AvatarType.PET);
         _loc2_.init();
         _loc2_.resetPartOffsets();
         while(false)
         {
            _loc3_ = var_845.pop();
            if(_loc3_ != null && !_loc3_.disposed)
            {
               _loc3_.imageReady();
            }
         }
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return var_403.getAssetByName(param1);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      override public function dispose() : void
      {
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
         if(var_195 != null)
         {
            var_195.dispose();
            var_195 = null;
         }
         if(var_351 != null)
         {
            var_351.dispose();
            var_351 = null;
         }
         if(var_708 != null)
         {
            var_708.dispose();
            var_708 = null;
         }
         if(var_403 != null)
         {
            var_403.dispose();
            var_403 = null;
         }
         var_845 = null;
         PartOffsetData.dispose();
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         init();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_195.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function createAvatarImage(param1:String, param2:String, param3:String = null) : IAvatarImage
      {
         var _loc4_:AvatarStructure = var_195.getValue(AvatarType.const_100) as AvatarStructure;
         if(_loc4_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc4_,var_403,param1,param2,param3);
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_351 as IPetDataManager;
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_708;
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.const_100:
               _loc3_ = var_195.getValue(AvatarType.const_100) as AvatarStructure;
               break;
            case AvatarType.PET:
               _loc3_ = var_195.getValue(AvatarType.PET) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      public function get mode() : String
      {
         return var_797;
      }
   }
}
