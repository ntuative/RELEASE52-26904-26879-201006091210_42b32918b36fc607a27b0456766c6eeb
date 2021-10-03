package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_2298:int = 200;
      
      private var var_794:int = 200;
      
      private var var_389:IFriendListTabsDeps;
      
      private var var_419:Array;
      
      private var var_1641:FriendListTab;
      
      private var var_1640:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_419 = new Array();
         super();
         var_389 = param1;
         var_419.push(new FriendListTab(var_389.getFriendList(),FriendListTab.const_88,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_419.push(new FriendListTab(var_389.getFriendList(),FriendListTab.const_93,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_419.push(new FriendListTab(var_389.getFriendList(),FriendListTab.const_355,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function findSelectedTab() : FriendListTab
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
      
      public function get tabContentWidth() : int
      {
         return var_1640 - 2;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_794 = var_2298;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_2298 = var_794;
            var_794 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_419)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_794 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
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
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_1641 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1641 != null)
         {
            return var_1641;
         }
         return var_419[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_794;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1640 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_419;
      }
      
      public function get windowWidth() : int
      {
         return var_1640;
      }
   }
}
