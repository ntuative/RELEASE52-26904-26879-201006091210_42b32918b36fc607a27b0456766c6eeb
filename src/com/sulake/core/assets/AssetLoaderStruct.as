package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_781:IAssetLoader;
      
      private var var_1228:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1228 = param1;
         var_781 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_781;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_781 != null)
            {
               if(true)
               {
                  var_781.dispose();
                  var_781 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1228;
      }
   }
}
