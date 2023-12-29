import 'package:ablytest/app/app.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(App());
}

//start function for websocket listen

// final clientOptions = ably.ClientOptions(key: 'ipikiw.OmQt4A:6_1pLPzwgrH2dp9QC-N886sPXeqxV1MTPj-WVhI_wA0');
// ably.Realtime realtime = ably.Realtime(options: clientOptions);
// channel = realtime.channels.get('Buyers-Mobile-App');
// var stream = channel.subscribe();
// var typeState;
// var channelMessageSubscription = stream.listen((ably.Message message){ final messsageData=message.data;
// print("New message arrived ${message.data}");
// if (messsageData is Map && messsageData.containsKey('bid_details'))
// {
// final bid = messsageData['bid_details']['status'].toString();
// print('Received status new value: $bid');
// }
//end function for websocket listen



// @override
// void initState() {
// super.initState();
// _model = createModel(context, () => VehicleDetailsBidModel());
//
// _model.tabBarController = TabController(
// vsync: this,
// length: 4,
// initialIndex: 0,
// )..addListener(() => setState(() {}));
// WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
// }

