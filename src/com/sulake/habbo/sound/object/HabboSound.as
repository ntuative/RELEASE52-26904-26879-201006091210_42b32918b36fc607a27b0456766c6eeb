package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1030:SoundChannel = null;
      
      private var var_844:Boolean;
      
      private var var_1029:Sound = null;
      
      private var var_739:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1029 = param1;
         var_1029.addEventListener(Event.COMPLETE,onComplete);
         var_739 = 1;
         var_844 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_844;
      }
      
      public function stop() : Boolean
      {
         var_1030.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_844 = false;
         var_1030 = var_1029.play(0);
         this.volume = var_739;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_739;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1030.position;
      }
      
      public function get length() : Number
      {
         return var_1029.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_739 = param1;
         if(var_1030 != null)
         {
            var_1030.soundTransform = new SoundTransform(var_739);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_844 = true;
      }
   }
}
