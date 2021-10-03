package com.sulake.habbo.avatar.pets
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarRenderManager;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class PetDataManager implements IPetDataManager
   {
       
      
      private var var_700:Array;
      
      private var var_250:Array;
      
      private var var_489:Map;
      
      private const const_1455:int = 1;
      
      private var var_150:int;
      
      private var _assets:AssetLibraryCollection;
      
      private const const_1726:int = 0;
      
      private var var_146:AvatarRenderManager;
      
      private const const_371:int = 2;
      
      public function PetDataManager(param1:AssetLibraryCollection, param2:AvatarRenderManager)
      {
         super();
         var_489 = new Map();
         _assets = param1;
         var_700 = [];
         var_146 = param2;
         var_250 = [];
         var_150 = const_1726;
         init();
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:Array = _assets.getAssetsByName("petData");
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.content as XML;
               _loc4_ = int(_loc3_.@species);
               var_489.add(_loc4_,new PetData(_loc3_));
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         _assets = null;
         var_146 = null;
         var_700 = null;
         var_489 = null;
         if(var_250 != null)
         {
            for each(_loc1_ in var_250)
            {
               _loc1_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
               _loc1_ = null;
            }
         }
         var_250 = null;
      }
      
      public function assetsReady(param1:int, param2:IPetDataListener = null) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(var_150 == const_371)
         {
            return true;
         }
         if(param2 != null)
         {
            addListener(param2);
         }
         if(var_150 == const_1455)
         {
            return false;
         }
         var _loc3_:* = [];
         _loc3_.push("pets_palettes.swf");
         _loc3_.push("h_dog.swf");
         _loc3_.push("h_cat.swf");
         _loc3_.push("h_croco.swf");
         _loc3_.push("h_terrier.swf");
         _loc3_.push("h_bear.swf");
         _loc3_.push("h_pig.swf");
         _loc3_.push("sh_dog.swf");
         _loc3_.push("sh_cat.swf");
         _loc3_.push("sh_croco.swf");
         _loc3_.push("sh_terrier.swf");
         _loc3_.push("sh_bear.swf");
         _loc3_.push("sh_pig.swf");
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = new LibraryLoader();
            _assets.loadFromFile(_loc4_);
            _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
            _loc4_.load(new URLRequest(_loc5_));
            var_250.push(_loc4_);
         }
         var_150 = const_1455;
         return false;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
         var _loc3_:int = var_250.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            var_250.splice(_loc3_,1);
         }
         if(false)
         {
            var_150 = const_371;
            var_146.resetPetData();
            notifyListeners();
         }
      }
      
      private function addListener(param1:IPetDataListener) : void
      {
         if(var_700.indexOf(param1) == -1)
         {
            var_700.push(param1);
         }
      }
      
      private function notifyListeners() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_700.pop() as IPetDataListener;
            if(_loc1_ != null)
            {
               _loc1_.petDataReady();
            }
         }
      }
      
      public function createPetFigureString(param1:int, param2:int, param3:uint) : String
      {
         var _loc4_:PetData = var_489.getValue(param1);
         if(_loc4_ == null)
         {
            Logger.log("Could not find Pet Data: " + param1);
            return "";
         }
         var _loc5_:Breed = _loc4_.findBreed(param2);
         var _loc6_:PetColor = _loc4_.findColor(param3);
         if(_loc5_ == null)
         {
            return "";
         }
         if(_loc6_ == null)
         {
            return _loc5_.avatarFigureString;
         }
         var _loc7_:Array = _loc5_.avatarFigureString.split(".");
         return _loc7_.join(_loc6_.figurePartPaletteColorId + ".");
      }
      
      public function getPetData(param1:int, param2:IPetDataListener = null) : IPetData
      {
         var _loc3_:IPetData = var_489.getValue(param1) as IPetData;
         assetsReady(param1,param2);
         return _loc3_;
      }
      
      public function get species() : Map
      {
         return var_489;
      }
      
      public function populateFigureData(param1:XML) : void
      {
         var targetSets:Array = null;
         var targetPalette:XML = null;
         var speciesKeys:Array = null;
         var key:int = 0;
         var petData:PetData = null;
         var petColorData:PetColor = null;
         var breed:Breed = null;
         var colorValue:String = null;
         var color:XML = null;
         var colorId:int = 0;
         var avatarFigureString:String = null;
         var targetSetName:String = null;
         var figureTargetSet:XML = null;
         var figurePart:XML = null;
         var setId:int = 0;
         var figureSet:XML = null;
         var figureData:XML = param1;
         targetSets = ["pbd","phd","ptl"];
         targetPalette = figureData.colors.palette.(@id == "1")[0];
         speciesKeys = var_489.getKeys();
         for each(key in speciesKeys)
         {
            petData = var_489.getValue(key);
            if(petData != null)
            {
               for each(petColorData in petData.colors)
               {
                  colorValue = petColorData.rgb.toString(16);
                  color = targetPalette.color.(text() == colorValue)[0];
                  if(color == null)
                  {
                     colorId = targetPalette.children().length() + 1;
                     color = <color id="{colorId}" index="{colorId}" club="0" selectable="1">{colorValue}</color>;
                     targetPalette.appendChild(color);
                  }
                  petColorData.figurePartPaletteColorId = parseInt(color.@id);
               }
               for each(breed in petData.breeds)
               {
                  avatarFigureString = "";
                  for each(targetSetName in targetSets)
                  {
                     figureTargetSet = figureData.sets.settype.(@type == targetSetName)[0];
                     if(figureTargetSet == null)
                     {
                        Logger.log("Could not find Figure Target Set for populating Pet Data: " + targetSetName);
                     }
                     else
                     {
                        figurePart = figureTargetSet.name_2.part.(@id == petData.species).(hasOwnProperty("palettemapid") && @palettemapid == breed.patternId)[0];
                        if(figurePart == null)
                        {
                        }
                        setId = figureTargetSet.children().length() + 1;
                        figureSet = <set id="{setId}" gender="U" club="0" colorable="1" selectable="1"/>;
                        figurePart = <part id="{petData.species}" breed="{breed.id}" type="{targetSetName}" colorable="1" colorindex="1" index="1"/>;
                        if(breed.patternId >= 0)
                        {
                           figurePart.@palettemapid = breed.patternId;
                        }
                        figureSet.appendChild(figurePart);
                        figureTargetSet.appendChild(figureSet);
                        avatarFigureString += targetSetName + "-" + setId + "-" + ".";
                     }
                  }
                  breed.avatarFigureString = avatarFigureString;
               }
            }
         }
      }
   }
}
