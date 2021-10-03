package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_432:String;
      
      private var var_1502:UserTagManager;
      
      private var var_717:Array;
      
      private var var_863:int = 0;
      
      private var var_409:Map;
      
      private var var_1500:Boolean = false;
      
      private var var_1501:GroupDetailsView;
      
      private var _name:String;
      
      private var var_498:int = 0;
      
      private var var_587:FurnitureDataParser;
      
      private var var_588:Array;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_18:IRoomSessionManager;
      
      private var var_1229:BadgeImageManager;
      
      private var _wallItems:Map;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1258:String;
      
      private var var_410:Map;
      
      private var var_1909:Boolean;
      
      private var _id:int;
      
      private var var_862:IgnoredUsersManager;
      
      private var var_894:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1034:HabboGroupInfoManager;
      
      private var var_610:String;
      
      private var var_861:Array;
      
      private var var_1908:Boolean;
      
      private var var_497:ProductDataParser;
      
      private var var_128:IHabboConfigurationManager;
      
      private var _respectTotal:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_717 = [];
         var_1502 = new UserTagManager(events);
         var_1034 = new HabboGroupInfoManager(this,events);
         var_862 = new IgnoredUsersManager(this);
         var_894 = new Dictionary();
         var_861 = [];
         var_588 = [];
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         var_497.removeEventListener(ProductDataParser.const_111,onProductsReady);
         var_1500 = true;
         for each(_loc2_ in var_861)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         var_861 = [];
      }
      
      public function getUserTags(param1:int) : Array
      {
         return var_1502.getTags(param1);
      }
      
      private function onCreditBalance(param1:CreditBalanceEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CreditBalanceParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(events != null)
         {
            events.dispatchEvent(new SessionCreditBalanceEvent(_loc2_.balance));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == _id)
         {
            _name = _loc3_.newName;
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var_410 = new Map();
         _wallItems = new Map();
         var_409 = new Map();
         var _loc2_:String = var_128.getKey("furnidata.load.url");
         var _loc3_:String = var_128.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_587 = new FurnitureDataParser(_loc2_,var_410,_wallItems,var_409,_localization);
         var_587.addEventListener(FurnitureDataParser.const_111,onFurnitureReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!var_1500)
         {
            loadProductData();
         }
         return var_894[param1];
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_1034.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_862.unignoreUser(param1);
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      override public function dispose() : void
      {
         if(var_410)
         {
            var_410.dispose();
            var_410 = null;
         }
         if(var_409)
         {
            var_409.dispose();
            var_409 = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_18)
         {
            var_18.release(new IIDHabboRoomSessionManager());
            var_18 = null;
         }
         if(var_128)
         {
            var_128.release(new IIDHabboConfigurationManager());
            var_128 = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         var_588 = null;
         if(var_587)
         {
            var_587.removeEventListener(FurnitureDataParser.const_111,onFurnitureReady);
            var_587.dispose();
            var_587 = null;
         }
         if(var_497)
         {
            var_497.removeEventListener(ProductDataParser.const_111,onProductsReady);
            var_497.dispose();
            var_497 = null;
         }
         super.dispose();
      }
      
      public function get systemOpen() : Boolean
      {
         return var_1909;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1229.getBadgeImage(param1,BadgeImageManager.const_986);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_128;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         _id = _loc3_.id;
         _name = _loc3_.name;
         _respectTotal = _loc3_.respectTotal;
         var_863 = _loc3_.respectLeft;
         var_498 = _loc3_.petRespectLeft;
         var_432 = _loc3_.figure;
         var_610 = _loc3_.sex;
         var_1258 = _loc3_.realName;
         var_862.initIgnoreList();
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(var_18 == null || _windowManager == null)
         {
            return;
         }
         var session:IRoomSession = var_18.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || isAnyRoomController)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_167)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return var_1034.getGroupDetails(param1);
      }
      
      public function getFloorItemDataByName(param1:String) : IFurnitureData
      {
         if(var_409 == null)
         {
            return null;
         }
         return getFloorItemData(parseInt(var_409.getValue(param1)));
      }
      
      public function get userId() : int
      {
         return _id;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_862.isIgnored(param1);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return var_498;
      }
      
      public function get realName() : String
      {
         return var_1258;
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         initBadgeImageManager();
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1909 = _loc2_.isOpen;
         var_1908 = _loc2_.onShutDown;
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_1500)
         {
            return true;
         }
         if(var_861.indexOf(param1) == -1)
         {
            var_861.push(param1);
         }
         if(var_497 == null)
         {
            _loc2_ = var_128.getKey("productdata.load.url");
            _loc3_ = var_128.getKey("external.hash");
            _loc2_ = _loc2_.replace("%hash%",_loc3_);
            var_497 = new ProductDataParser(_loc2_,var_894);
            var_497.addEventListener(ProductDataParser.const_111,onProductsReady);
         }
         return false;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1229.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_863 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         var_863 = var_863 - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         var_128 = param2 as IHabboConfigurationManager;
         initBadgeImageManager();
         (var_128 as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(var_1501 == null)
         {
            var_1501 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = var_1034.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            var_1501.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var_587.removeEventListener(FurnitureDataParser.const_111,onFurnitureReady);
         for each(_loc2_ in var_588)
         {
            _loc2_.furniDataReady();
         }
         var_588 = [];
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_498 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         var_498 = var_498 - 1;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(false && var_588.indexOf(param1) == -1)
         {
            var_588.push(param1);
            return null;
         }
         var _loc2_:Array = var_410.getValues();
         return _loc2_.concat(_wallItems.getValues());
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_432 = _loc2_.figure;
            var_610 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(_id,var_432,var_610));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(var_128 != null)
         {
            urlString = var_128.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(var_717 == null)
         {
            return false;
         }
         return var_717.indexOf(param1) >= 0;
      }
      
      public function getWallItemDataByName(param1:String) : IFurnitureData
      {
         if(var_409 == null)
         {
            return null;
         }
         return getWallItemData(parseInt(var_409.getValue(param1)));
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_862.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         var_717 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         if(_communication == null)
         {
            return;
         }
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(onAvailabilityStatus));
         _communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(onCreditBalance));
         _communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(onPetRespectFailed));
         var_1502.communication = _communication;
         var_1034.communication = _communication;
         var_862.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_1908;
      }
      
      public function get gender() : String
      {
         return var_610;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++var_498;
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(var_410 == null)
         {
            return null;
         }
         return var_410.getValue(param1.toString());
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(var_717 == null)
         {
            return false;
         }
         return var_717.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(_wallItems == null)
         {
            return null;
         }
         return _wallItems.getValue(param1.toString());
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(var_1229 != null)
         {
            return;
         }
         if(var_128 == null || _localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         var_1229 = new BadgeImageManager(_loc1_,events,var_128,_localization);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_18 = param2 as IRoomSessionManager;
      }
      
      public function get respectLeft() : int
      {
         return var_863;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_18;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
   }
}
