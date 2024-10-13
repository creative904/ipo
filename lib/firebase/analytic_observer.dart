import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:ipo_tracker/firebase/firebase_handler.dart';


class ObserverAnalytics{
  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);



   void customEvent(String eventName,[Map<String, Object>? parameters]){
     if(FireBaseHandler.enableFirebaseEvents){
       analytics.logEvent(name: eventName,parameters: parameters);
     }
  }

}