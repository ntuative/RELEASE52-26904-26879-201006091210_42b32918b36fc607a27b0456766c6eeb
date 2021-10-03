package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_582:int = 6;
      
      public static const const_249:int = 5;
      
      public static const const_605:int = 2;
      
      public static const const_311:int = 9;
      
      public static const const_363:int = 4;
      
      public static const const_283:int = 2;
      
      public static const const_566:int = 4;
      
      public static const const_212:int = 8;
      
      public static const const_682:int = 7;
      
      public static const const_276:int = 3;
      
      public static const const_329:int = 1;
      
      public static const const_226:int = 5;
      
      public static const const_475:int = 12;
      
      public static const const_341:int = 1;
      
      public static const const_622:int = 11;
      
      public static const const_747:int = 3;
      
      public static const const_1592:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_419:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_419 = new Array();
         var_419.push(new Tab(_navigator,const_329,const_475,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_387));
         var_419.push(new Tab(_navigator,const_283,const_341,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_387));
         var_419.push(new Tab(_navigator,const_363,const_622,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_889));
         var_419.push(new Tab(_navigator,const_276,const_249,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_387));
         var_419.push(new Tab(_navigator,const_226,const_212,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_686));
         setSelectedTab(const_329);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_419)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_419)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_419)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_363;
      }
      
      public function get tabs() : Array
      {
         return var_419;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
