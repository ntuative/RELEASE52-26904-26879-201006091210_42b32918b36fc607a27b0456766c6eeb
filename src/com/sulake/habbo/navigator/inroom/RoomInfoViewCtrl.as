package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_728:IWindowContainer;
      
      private var var_1056:ITextWindow;
      
      private var var_199:RoomSettingsCtrl;
      
      private var var_1263:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1268:ITextWindow;
      
      private var var_361:IWindowContainer;
      
      private var var_2009:IWindowContainer;
      
      private var var_2012:ITextWindow;
      
      private var var_881:IWindowContainer;
      
      private var var_1526:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_698:ITextWindow;
      
      private var var_1529:IWindowContainer;
      
      private var var_1269:IWindowContainer;
      
      private var var_882:ITextWindow;
      
      private var var_1057:ITextFieldWindow;
      
      private var var_310:IWindowContainer;
      
      private var var_883:ITextWindow;
      
      private var var_1527:IButtonWindow;
      
      private var var_1058:ITextWindow;
      
      private var var_2380:int;
      
      private var var_1267:IContainerButtonWindow;
      
      private var var_880:IWindowContainer;
      
      private var var_1266:ITextWindow;
      
      private var var_1264:IContainerButtonWindow;
      
      private var var_1528:ITextWindow;
      
      private var var_1530:IButtonWindow;
      
      private var var_864:TagRenderer;
      
      private var var_2010:ITextWindow;
      
      private var var_360:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_729:ITextWindow;
      
      private var var_271:RoomThumbnailCtrl;
      
      private var var_1265:IContainerButtonWindow;
      
      private var var_2011:IWindowContainer;
      
      private var var_270:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_360 = new RoomEventViewCtrl(_navigator);
         var_199 = new RoomSettingsCtrl(_navigator,this,true);
         var_271 = new RoomThumbnailCtrl(_navigator);
         var_864 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_199);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_199.active = true;
         this.var_360.active = false;
         this.var_271.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1526.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1530.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1529.visible = Util.hasVisibleChildren(var_1529);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_698.text = param1.roomName;
         var_698.height = NaN;
         _ownerName.text = param1.ownerName;
         var_882.text = param1.description;
         var_864.refreshTags(var_361,param1.tags);
         var_882.visible = false;
         if(param1.description != "")
         {
            var_882.height = NaN;
            var_882.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_361,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_361,"thumb_down",_loc3_,onThumbDown,0);
         var_2012.visible = _loc3_;
         var_883.visible = !_loc3_;
         var_1528.visible = !_loc3_;
         var_1528.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_361,"home",param2,null,0);
         _navigator.refreshButton(var_361,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_361,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_698.y,0);
         var_361.visible = true;
         var_361.height = Util.getLowestPoint(var_361);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_491,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1527.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1263.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1265.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1267.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1264.visible = _navigator.data.canEditRoomSettings && param1;
         var_1269.visible = Util.hasVisibleChildren(var_1269);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_360.active = false;
         this.var_199.active = false;
         this.var_271.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_360.active = false;
         this.var_199.active = false;
         this.var_271.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_491,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_310);
         var_310.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_199.refresh(var_310);
         this.var_271.refresh(var_310);
         Util.moveChildrenToColumn(var_310,["room_details","room_buttons"],0,2);
         var_310.height = Util.getLowestPoint(var_310);
         var_310.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1057.setSelection(0,var_1057.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_270);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_360.refresh(var_270);
         if(Util.hasVisibleChildren(var_270) && !this.var_271.active)
         {
            Util.moveChildrenToColumn(var_270,["event_details","event_buttons"],0,2);
            var_270.height = Util.getLowestPoint(var_270);
            var_270.visible = true;
         }
         else
         {
            var_270.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_360.active = true;
         this.var_199.active = false;
         this.var_271.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1056.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1056.height = NaN;
         var_1268.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1268.height = NaN;
         Util.moveChildrenToColumn(var_728,["public_space_name","public_space_desc"],var_1056.y,0);
         var_728.visible = true;
         var_728.height = Math.max(86,Util.getLowestPoint(var_728));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "RoomVisualizationData";
         if(_loc1_ && true && true && true)
         {
            var_880.visible = true;
            var_1057.text = this.getEmbedData();
         }
         else
         {
            var_880.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_199.load(param1);
         this.var_199.active = true;
         this.var_360.active = false;
         this.var_271.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_199.active = false;
         this.var_360.active = false;
         this.var_271.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_75,false);
         _window.setParamFlag(HabboWindowParam.const_1376,true);
         _window.visible = false;
         var_310 = IWindowContainer(find("room_info"));
         var_361 = IWindowContainer(find("room_details"));
         var_728 = IWindowContainer(find("public_space_details"));
         var_2011 = IWindowContainer(find("owner_name_cont"));
         var_2009 = IWindowContainer(find("rating_cont"));
         var_1269 = IWindowContainer(find("room_buttons"));
         var_698 = ITextWindow(find("room_name"));
         var_1056 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_882 = ITextWindow(find("room_desc"));
         var_1268 = ITextWindow(find("public_space_desc"));
         var_1058 = ITextWindow(find("owner_caption"));
         var_883 = ITextWindow(find("rating_caption"));
         var_2012 = ITextWindow(find("rate_caption"));
         var_1528 = ITextWindow(find("rating_txt"));
         var_270 = IWindowContainer(find("event_info"));
         var_881 = IWindowContainer(find("event_details"));
         var_1529 = IWindowContainer(find("event_buttons"));
         var_2010 = ITextWindow(find("event_name"));
         var_729 = ITextWindow(find("event_desc"));
         var_1263 = IContainerButtonWindow(find("add_favourite_button"));
         var_1265 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1267 = IContainerButtonWindow(find("make_home_button"));
         var_1264 = IContainerButtonWindow(find("unmake_home_button"));
         var_1527 = IButtonWindow(find("room_settings_button"));
         var_1526 = IButtonWindow(find("create_event_button"));
         var_1530 = IButtonWindow(find("edit_event_button"));
         var_880 = IWindowContainer(find("embed_info"));
         var_1266 = ITextWindow(find("embed_info_txt"));
         var_1057 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1263,onAddFavouriteClick);
         Util.setProcDirectly(var_1265,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1527,onRoomSettingsClick);
         Util.setProcDirectly(var_1267,onMakeHomeClick);
         Util.setProcDirectly(var_1264,onUnmakeHomeClick);
         Util.setProcDirectly(var_1526,onEventSettingsClick);
         Util.setProcDirectly(var_1530,onEventSettingsClick);
         Util.setProcDirectly(var_1057,onEmbedSrcClick);
         _navigator.refreshButton(var_1263,"favourite",true,null,0);
         _navigator.refreshButton(var_1265,"favourite",true,null,0);
         _navigator.refreshButton(var_1267,"home",true,null,0);
         _navigator.refreshButton(var_1264,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_310,onHover);
         Util.setProcDirectly(var_270,onHover);
         var_1058.width = var_1058.textWidth;
         Util.moveChildrenToRow(var_2011,["owner_caption","owner_name"],var_1058.x,var_1058.y,3);
         var_883.width = var_883.textWidth;
         Util.moveChildrenToRow(var_2009,["rating_caption","rating_txt"],var_883.x,var_883.y,3);
         var_1266.height = NaN;
         Util.moveChildrenToColumn(var_880,["embed_info_txt","embed_src_txt"],var_1266.y,2);
         var_880.height = Util.getLowestPoint(var_880) + 5;
         var_2380 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2010.text = param1.eventName;
         var_729.text = param1.eventDescription;
         var_864.refreshTags(var_881,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_729.visible = false;
         if(param1.eventDescription != "")
         {
            var_729.height = NaN;
            var_729.y = Util.getLowestPoint(var_881) + 2;
            var_729.visible = true;
         }
         var_881.visible = true;
         var_881.height = Util.getLowestPoint(var_881);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_907,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
