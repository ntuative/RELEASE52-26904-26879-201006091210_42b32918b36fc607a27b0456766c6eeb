package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_756:String = "Rectangle";
      
      public static const const_64:String = "Boolean";
      
      public static const const_638:String = "Number";
      
      public static const const_65:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_740:String = "Point";
      
      public static const const_965:String = "Array";
      
      public static const const_984:String = "uint";
      
      public static const const_484:String = "hex";
      
      public static const const_932:String = "Map";
       
      
      private var var_582:String;
      
      private var var_173:Object;
      
      private var var_2370:Boolean;
      
      private var _type:String;
      
      private var var_1869:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_582 = param1;
         var_173 = param2;
         _type = param3;
         var_1869 = param4;
         var_2370 = param3 == const_932 || param3 == const_965 || param3 == const_740 || param3 == const_756;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_484:
               return "0x" + uint(var_173).toString(16);
            case const_64:
               return Boolean(var_173) == true ? "RoomVisualizationData" : "false";
            case const_740:
               return "Point(" + Point(var_173).x + ", " + Point(var_173).y + ")";
            case const_756:
               return "Rectangle(" + Rectangle(var_173).x + ", " + Rectangle(var_173).y + ", " + Rectangle(var_173).width + ", " + Rectangle(var_173).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_932:
               _loc3_ = var_173 as Map;
               _loc1_ = "<var key=\"" + var_582 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_965:
               _loc4_ = var_173 as Array;
               _loc1_ = "<var key=\"" + var_582 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_740:
               _loc5_ = var_173 as Point;
               _loc1_ = "<var key=\"" + var_582 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_756:
               _loc6_ = var_173 as Rectangle;
               _loc1_ = "<var key=\"" + var_582 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_65 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_484:
               _loc1_ = "<var key=\"" + var_582 + "\" value=\"" + "0x" + uint(var_173).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_582 + "\" value=\"" + var_173 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_173;
      }
      
      public function get valid() : Boolean
      {
         return var_1869;
      }
      
      public function get key() : String
      {
         return var_582;
      }
   }
}
