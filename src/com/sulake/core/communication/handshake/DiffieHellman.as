package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1376:BigInteger;
      
      private var var_622:BigInteger;
      
      private var var_1601:BigInteger;
      
      private var var_1600:BigInteger;
      
      private var var_2209:BigInteger;
      
      private var var_2210:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1376 = param1;
         var_1601 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2209.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1600 = new BigInteger();
         var_1600.fromRadix(param1,param2);
         var_2209 = var_1600.modPow(var_622,var_1376);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2210.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1376.toString() + ",generator: " + var_1601.toString() + ",secret: " + param1);
         var_622 = new BigInteger();
         var_622.fromRadix(param1,param2);
         var_2210 = var_1601.modPow(var_622,var_1376);
         return true;
      }
   }
}
