package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1700:String = "e";
      
      public static const const_1662:String = "i";
      
      public static const const_1554:String = "s";
       
      
      private var _id:int;
      
      private var var_1820:String;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1817:int;
      
      private var var_1210:Array;
      
      private var var_1819:int;
      
      private var var_1816:int;
      
      private var var_1818:int;
      
      private var _name:String;
      
      private var var_1815:int;
      
      private var var_1243:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1817 = param4;
         var_1815 = param5;
         var_1819 = param6;
         var_1816 = param7;
         var_1818 = param8;
         var_1210 = param9;
         _title = param10;
         var_1243 = param11;
         var_1820 = param12;
      }
      
      public function get tileSizeY() : int
      {
         return var_1816;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1818;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get adUrl() : String
      {
         return var_1820;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1815;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1817;
      }
      
      public function get tileSizeX() : int
      {
         return var_1819;
      }
      
      public function get colours() : Array
      {
         return var_1210;
      }
      
      public function get description() : String
      {
         return var_1243;
      }
   }
}
