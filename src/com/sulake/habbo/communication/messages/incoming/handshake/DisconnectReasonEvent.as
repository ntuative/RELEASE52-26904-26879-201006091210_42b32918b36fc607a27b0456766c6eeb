package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1537:int = 5;
      
      public static const const_1507:int = 113;
      
      public static const const_1484:int = 29;
      
      public static const const_1642:int = 0;
      
      public static const const_1713:int = 102;
      
      public static const const_1547:int = 25;
      
      public static const const_1688:int = 20;
      
      public static const const_1544:int = 116;
      
      public static const const_1524:int = 114;
      
      public static const const_1501:int = 101;
      
      public static const const_1572:int = 108;
      
      public static const const_1581:int = 112;
      
      public static const const_1504:int = 100;
      
      public static const const_1630:int = 24;
      
      public static const const_1383:int = 10;
      
      public static const const_1549:int = 111;
      
      public static const const_1626:int = 23;
      
      public static const const_1539:int = 26;
      
      public static const const_1227:int = 2;
      
      public static const const_1487:int = 22;
      
      public static const const_1714:int = 17;
      
      public static const const_1651:int = 18;
      
      public static const const_1666:int = 3;
      
      public static const const_1506:int = 109;
      
      public static const const_1377:int = 1;
      
      public static const const_1555:int = 103;
      
      public static const const_1681:int = 11;
      
      public static const const_1616:int = 28;
      
      public static const const_1638:int = 104;
      
      public static const const_1656:int = 13;
      
      public static const const_1686:int = 107;
      
      public static const const_1557:int = 27;
      
      public static const const_1498:int = 118;
      
      public static const const_1628:int = 115;
      
      public static const const_1676:int = 16;
      
      public static const const_1664:int = 19;
      
      public static const const_1604:int = 4;
      
      public static const const_1661:int = 105;
      
      public static const const_1586:int = 117;
      
      public static const const_1684:int = 119;
      
      public static const const_1683:int = 106;
      
      public static const const_1697:int = 12;
      
      public static const const_1545:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1377:
            case const_1383:
               return "banned";
            case const_1227:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
