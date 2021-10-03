package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2288:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_147:TutorialUI;
      
      private var var_790:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_62:HelpUI;
      
      private var var_789:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_648:HotelMergeUI;
      
      private var var_304:IHabboCommunicationManager;
      
      private var var_966:FaqIndex;
      
      private var var_1994:String = "";
      
      private var var_1020:IncomingMessages;
      
      private var var_1404:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1404 = new CallForHelpData();
         var_2288 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_966 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_62 != null)
         {
            var_62.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_62 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_62.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_147 != null)
         {
            var_147.dispose();
            var_147 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1994;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_62 != null)
         {
            var_62.dispose();
            var_62 = null;
         }
         if(var_147 != null)
         {
            var_147.dispose();
            var_147 = null;
         }
         if(var_648)
         {
            var_648.dispose();
            var_648 = null;
         }
         if(var_966 != null)
         {
            var_966.dispose();
            var_966 = null;
         }
         var_1020 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_790)
         {
            var_790.release(new IIDHabboLocalizationManager());
            var_790 = null;
         }
         if(var_304)
         {
            var_304.release(new IIDHabboCommunicationManager());
            var_304 = null;
         }
         if(var_789)
         {
            var_789.release(new IIDHabboConfigurationManager());
            var_789 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_790;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_102:
               if(var_62 != null)
               {
                  var_62.setRoomSessionStatus(true);
               }
               if(var_147 != null)
               {
                  var_147.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_112:
               if(var_62 != null)
               {
                  var_62.setRoomSessionStatus(false);
               }
               if(var_147 != null)
               {
                  var_147.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_62 != null)
         {
            var_62.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2288;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_62 != null)
         {
            var_62.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_648)
         {
            var_648 = new HotelMergeUI(this);
         }
         var_648.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_147 == null && _assetLibrary != null && _windowManager != null)
         {
            var_147 = new TutorialUI(this);
         }
         return var_147 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_62 == null && _assetLibrary != null && _windowManager != null)
         {
            var_62 = new HelpUI(this,_assetLibrary,_windowManager,var_790,_toolbar);
         }
         return var_62 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1404;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1404.reportedUserId = param1;
         var_1404.reportedUserName = param2;
         var_62.showUI(HabboHelpViewEnum.const_351);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1994 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_132,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_790 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_147 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_147.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_304 = IHabboCommunicationManager(param2);
         var_1020 = new IncomingMessages(this,var_304);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_62 != null)
         {
            var_62.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_62 != null)
         {
            var_62.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_304 != null && param1 != null)
         {
            var_304.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_966;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_62 != null)
         {
            var_62.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_789 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_147;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_89)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_60)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_648;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_102,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_112,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_89,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_60,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_62 != null)
         {
            var_62.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_789 == null)
         {
            return param1;
         }
         return var_789.getKey(param1,param2,param3);
      }
   }
}
