package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1185:int = 0;
       
      
      private var var_72:Vector3d;
      
      private var _updateID:int;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var _model:RoomObjectModel;
      
      private var var_397:IRoomObjectEventHandler;
      
      private var var_1466:Vector3d;
      
      private var _instanceId:int = 0;
      
      private var _id:int;
      
      private var var_1467:Vector3d;
      
      private var var_225:Vector3d;
      
      private var var_480:Array;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         _id = param1;
         var_72 = new Vector3d();
         var_225 = new Vector3d();
         var_1466 = new Vector3d();
         var_1467 = new Vector3d();
         var_480 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_480[_loc3_] = 0;
            _loc3_--;
         }
         _model = new RoomObjectModel();
         _visualization = null;
         var_397 = null;
         _updateID = 0;
         _instanceId = var_1185++;
      }
      
      public function getInstanceId() : int
      {
         return _instanceId;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_72 = null;
         var_225 = null;
         if(_model != null)
         {
            _model.dispose();
            _model = null;
         }
         var_480 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1466.assign(var_72);
         return var_1466;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_72.x != param1.x || var_72.y != param1.y || var_72.z != param1.z)
         {
            var_72.x = param1.x;
            var_72.y = param1.y;
            var_72.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_225.x != param1.x || var_225.y != param1.y || var_225.z != param1.z)
         {
            var_225.x = (param1.x % 360 + 360) % 360;
            var_225.y = (param1.y % 360 + 360) % 360;
            var_225.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_397;
      }
      
      public function getDirection() : IVector3d
      {
         var_1467.assign(var_225);
         return var_1467;
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < var_480.length)
         {
            if(var_480[param2] != param1)
            {
               var_480[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_397)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_397;
         if(_loc2_ != null)
         {
            var_397 = null;
            _loc2_.object = null;
         }
         var_397 = param1;
         if(var_397 != null)
         {
            var_397.object = this;
         }
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_480.length)
         {
            return var_480[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return _model;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return _model;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
