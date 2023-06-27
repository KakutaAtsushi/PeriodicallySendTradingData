//+------------------------------------------------------------------+
//|                                                  webrequests.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   EventSetTimer(1);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+

void OnDeinit(const int reason)
  {
   EventKillTimer();
  }
  

//+------------------------------------------------------------------+
//| Expert timer function                                             |
//+------------------------------------------------------------------+
void OnTimer(){
   string cookie=NULL,headers; 
   char post[],result[]; 
   int res; 
   string google_url="https://jsonplaceholder.typicode.com/todos/1"; 

   ResetLastError(); 

   int timeout=5000;
   res = WebRequest("GET", google_url, cookie, NULL, timeout, post, 0, result, headers); 

   if(res==-1) { 
      Print("Error in WebRequest. Error code  =",GetLastError()); 
      //--- Perhaps the URL is not listed, display a message about the necessity to add the address 
      MessageBox("Add the address '"+google_url+"' in the list of allowed URLs on tab 'Expert Advisors'","Error",MB_ICONINFORMATION); 
     } 
   else {
      Print("test");
      Print(res);
      string text = CharArrayToString(result);
      Print(text);
     }
}
//+------------------------------------------------------------------+
