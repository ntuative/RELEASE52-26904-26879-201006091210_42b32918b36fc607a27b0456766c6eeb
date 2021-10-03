package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.events.EventDispatcher;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_673:int = 8;
      
      public static const const_1538:int = 10;
      
      public static const const_1179:int = 6;
      
      private static var var_1083:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1205:int = 0;
      
      public static const const_1551:int = 1;
      
      public static const const_1593:int = 2;
      
      public static const const_1663:int = 3;
      
      public static const const_1701:int = 4;
      
      public static const const_1566:int = 5;
      
      public static const const_1627:int = 9;
      
      public static const const_1679:int = 7;
       
      
      private var var_180:uint = 0;
      
      private var var_1082:uint = 0;
      
      private var var_744:Date;
      
      private var var_2105:int = -1;
      
      private var var_96:Function;
      
      private var var_529:Boolean = false;
      
      private var _eventDispatcher:EventDispatcher;
      
      private var var_2398:int = -1;
      
      private var var_1311:uint = 0;
      
      private var var_2104:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_902:uint;
      
      private var var_20:ByteArray;
      
      private var var_745:uint;
      
      private var var_1571:Boolean = false;
      
      private var var_2397:int = -1;
      
      private var var_1570:String = "2.0";
      
      private var var_181:Boolean = false;
      
      private var var_2103:Boolean = false;
      
      private var var_365:String;
      
      private var var_609:uint = 0;
      
      private var var_1312:int = 0;
      
      private var var_430:String = "";
      
      private var var_746:int = 8;
      
      private var var_1569:Boolean = false;
      
      public function FZipFile(param1:EventDispatcher, param2:String = "utf-8")
      {
         var_96 = parseFileHead;
         super();
         var_365 = param2;
         _eventDispatcher = param1;
         _extraFields = new Dictionary();
         var_20 = new ByteArray();
         var_20.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_609;
      }
      
      public function set filename(param1:String) : void
      {
         var_430 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_181 && false)
         {
            var_20.position = 0;
            if(var_1083)
            {
               var_20.uncompress.apply(var_20,["deflate"]);
            }
            else
            {
               var_20.uncompress();
            }
            var_20.position = 0;
            var_181 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_430;
      }
      
      public function get date() : Date
      {
         return var_744;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && var_96(param1))
         {
         }
         return var_96 === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1569)
         {
            var_96 = parseFileIdle;
            _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_136,"Data descriptors are not supported."));
            return false;
         }
         if(var_180 == 0)
         {
            var_96 = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_180)
            {
               return false;
            }
            parseContent(param1);
            var_96 = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1570;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_181)
         {
            uncompress();
         }
         var_20.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_20.readUTFBytes(var_20.bytesAvailable);
         }
         else
         {
            _loc3_ = var_20.readMultiByte(var_20.bytesAvailable,param2);
         }
         var_20.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_746 === const_673 && !var_1571)
         {
            if(var_1083)
            {
               param1.readBytes(var_20,0,var_180);
            }
            else
            {
               if(!var_529)
               {
                  _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_136,"Adler32 checksum not found."));
                  return;
               }
               var_20.writeByte(120);
               _loc2_ = uint(~var_2105 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_20.writeByte(_loc2_);
               param1.readBytes(var_20,2,var_180);
               var_20.position = var_20.length;
               var_20.writeUnsignedInt(var_902);
            }
            var_181 = true;
         }
         else
         {
            if(var_746 != const_1205)
            {
               _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_136,"Compression method " + var_746 + " is not supported."));
               return;
            }
            param1.readBytes(var_20,0,var_180);
            var_181 = false;
         }
         var_20.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1082 + var_1311 > 0)
            {
               var_96 = parseFileHeadExt;
            }
            else
            {
               var_96 = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_20.length = 0;
         var_20.position = 0;
         var_181 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_20.writeUTFBytes(param1);
            }
            else
            {
               var_20.writeMultiByte(param1,param2);
            }
            var_745 = ChecksumUtil.CRC32(var_20);
            var_529 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_744 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1312 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1312 << 8 | 20);
         param1.writeShort(var_365 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_673);
         var _loc5_:Date = var_744 != null ? var_744 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_745);
         param1.writeUnsignedInt(var_180);
         param1.writeUnsignedInt(var_609);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_365 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_430);
         }
         else
         {
            _loc8_.writeMultiByte(var_430,var_365);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_529)
            {
               _loc16_ = var_181;
               if(_loc16_)
               {
                  uncompress();
               }
               var_902 = ChecksumUtil.Adler32(var_20,0,var_20.length);
               var_529 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_902);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_365 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2104);
            }
            else
            {
               _loc8_.writeMultiByte(var_2104,var_365);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_180 > 0)
         {
            if(var_1083)
            {
               _loc13_ = 0;
               param1.writeBytes(var_20,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_20,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_180;
      }
      
      protected function compress() : void
      {
         if(!var_181)
         {
            if(false)
            {
               var_20.position = 0;
               var_609 = var_20.length;
               if(var_1083)
               {
                  var_20.compress.apply(var_20,["deflate"]);
                  var_180 = var_20.length;
               }
               else
               {
                  var_20.compress();
                  var_180 = -6;
               }
               var_20.position = 0;
               var_181 = true;
            }
            else
            {
               var_180 = 0;
               var_609 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1082 + var_1311)
         {
            parseHeadExt(param1);
            var_96 = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_365 == "utf-8")
         {
            var_430 = param1.readUTFBytes(var_1082);
         }
         else
         {
            var_430 = param1.readMultiByte(var_1082,var_365);
         }
         var _loc2_:uint = var_1311;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               _eventDispatcher.dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_136,"Parse error in file " + var_430 + ": Extra field data size too big."));
               return;
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_902 = param1.readUnsignedInt();
               var_529 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1312 = _loc2_ >> 8;
         var_1570 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_746 = param1.readUnsignedShort();
         var_1571 = (_loc3_ & 1) !== 0;
         var_1569 = (_loc3_ & 8) !== 0;
         var_2103 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_365 = "utf-8";
         }
         if(var_746 === const_1179)
         {
            var_2397 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2398 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_746 === const_673)
         {
            var_2105 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_744 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_745 = param1.readUnsignedInt();
         var_180 = param1.readUnsignedInt();
         var_609 = param1.readUnsignedInt();
         var_1082 = param1.readUnsignedShort();
         var_1311 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_20,0,param1.length);
            var_745 = ChecksumUtil.CRC32(var_20);
            var_529 = false;
         }
         else
         {
            var_20.length = 0;
            var_20.position = 0;
            var_181 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_430 + "\n  date:" + var_744 + "\n  sizeCompressed:" + var_180 + "\n  sizeUncompressed:" + var_609 + "\n  versionHost:" + var_1312 + "\n  versionNumber:" + var_1570 + "\n  compressionMethod:" + var_746 + "\n  encrypted:" + var_1571 + "\n  hasDataDescriptor:" + var_1569 + "\n  hasCompressedPatchedData:" + var_2103 + "\n  filenameEncoding:" + var_365 + "\n  crc32:" + var_745.toString(16) + "\n  adler32:" + var_902.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_181)
         {
            uncompress();
         }
         return var_20;
      }
   }
}
