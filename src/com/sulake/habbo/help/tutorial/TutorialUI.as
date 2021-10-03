package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_216:String = "TUI_NAME_VIEW";
      
      public static const const_87:String = "TUI_MAIN_VIEW";
      
      public static const const_344:String = "TUI_CLOTHES_VIEW";
      
      public static const const_468:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_1112:Boolean = false;
      
      private var var_1110:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_1598:int = 0;
      
      private var _main:HabboHelp;
      
      private var var_1111:Boolean = false;
      
      private var var_1371:Boolean = false;
      
      private var var_1599:int = 0;
      
      private var var_34:ITutorialUIView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         _main = param1;
         _main.events.addEventListener(HabboHelpTutorialEvent.const_501,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_505,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_397,onTaskDoneEvent);
      }
      
      public function prepareForTutorial() : void
      {
         if(_main == null || true)
         {
            return;
         }
         _main.hideUI();
         _main.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_116));
      }
      
      public function get help() : HabboHelp
      {
         return _main;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1112;
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var_1111 = param1;
         var_1110 = param2;
         var_1112 = param3;
         if(var_34 == null || var_34.id == const_87)
         {
            prepareForTutorial();
            showView(const_87);
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeView();
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!_main || true || true)
         {
            return;
         }
         var_1110 = true;
         _main.localization.registerParameter("help.tutorial.name.changed","name",name);
         _main.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
         if(var_34 != null && (var_34.id == const_216 || var_34.id == const_87))
         {
            showView(const_87);
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(hasTasksDone)
         {
            if(_main)
            {
               _main.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(_window == null)
         {
            _window = buildXmlWindow("tutorial_frame") as IWindowContainer;
            if(_window == null)
            {
               return;
            }
            _window.procedure = windowProcedure;
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            var_1599 = 0 - _loc2_.width;
            var_1598 = _window.height;
            _loc3_ = true;
         }
         _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(var_34 != null)
         {
            var_34.dispose();
         }
         switch(param1)
         {
            case const_87:
               var_34 = new TutorialMainView(_loc2_,this);
               break;
            case const_216:
               var_34 = new TutorialNameChangeView(this);
               _loc2_.addListItem(var_34.view);
               prepareForTutorial();
               break;
            case const_344:
               var_34 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_468:
               var_34 = new TutorialCallGuideBotView(_loc2_,this);
         }
         _window.height = _loc2_.height + var_1598;
         _window.width = _loc2_.width + var_1599;
         if(_loc3_)
         {
            if(_window == null)
            {
               return;
            }
            _window.x = _window.context.getDesktopWindow().width / 2 - 0;
            _window.y = 0;
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return _main.assets;
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.method_3 != ChangeUserNameResultMessageEvent.var_660)
         {
            showView(const_216);
            (var_34 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.method_3,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _main.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1111;
      }
      
      public function dispose() : void
      {
         disposeView();
         if(_main)
         {
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_501,onTaskDoneEvent);
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_505,onTaskDoneEvent);
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_397,onTaskDoneEvent);
            _main = null;
         }
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_501:
               var_1112 = true;
               if(var_34 != null && var_34.id == const_468)
               {
                  showView(const_87);
               }
               break;
            case HabboHelpTutorialEvent.const_505:
               if(var_34 != null && var_34.id == const_344)
               {
                  var_1371 = true;
                  disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_397:
               if(var_1371)
               {
                  var_1371 = false;
                  showView(const_87);
               }
         }
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1110;
      }
      
      public function get myName() : String
      {
         return _main.ownUserName;
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         showView(const_216);
         var _loc3_:TutorialNameChangeView = var_34 as TutorialNameChangeView;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc2_.method_3 == ChangeUserNameResultMessageEvent.var_660)
         {
            _loc3_.checkedName = _loc2_.name;
         }
         else
         {
            _loc3_.setNameNotAvailableView(_loc2_.method_3,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      private function disposeView() : void
      {
         if(var_34 != null)
         {
            var_34.dispose();
            var_34 = null;
         }
         disposeWindow();
      }
      
      public function onUserChanged() : void
      {
         var_1111 = true;
         if(var_34 != null && (var_34.id == const_344 || var_34.id == const_87))
         {
            showView(const_87);
         }
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(_main == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(_main.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_main.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  disposeView();
               }
         }
      }
      
      public function get hasTasksDone() : Boolean
      {
         return var_1111 && var_1110 && var_1112;
      }
   }
}
