package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1933:Boolean;
      
      private var var_1510:Array;
      
      private var var_1937:Boolean;
      
      private var var_1935:Boolean;
      
      private var var_1932:Boolean;
      
      private var var_165:Array;
      
      private var var_1934:Boolean;
      
      private var var_1936:Boolean;
      
      private var var_1509:Array;
      
      private var var_1938:Boolean;
      
      private var var_1939:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1939;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1933;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1937;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1934;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1936;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1510;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_165 = [];
         var_1510 = [];
         _roomMessageTemplates = [];
         var_1509 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_165.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1510.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1509.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1934 = param1.readBoolean();
         var_1932 = param1.readBoolean();
         var_1937 = param1.readBoolean();
         var_1935 = param1.readBoolean();
         var_1939 = param1.readBoolean();
         var_1936 = param1.readBoolean();
         var_1933 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1938 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1935;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1509;
      }
      
      public function get issues() : Array
      {
         return var_165;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1938;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1932;
      }
   }
}
