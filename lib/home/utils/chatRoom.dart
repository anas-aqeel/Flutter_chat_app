import 'package:chat_app_ui/home/pages/ChatScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app_ui/Auth/authenticator.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<void> generateChatRoomId(String userId) async {
  var chatRoomId = '${userData["userId"]}$userId';
  dynamic clientData = await firestore.collection('users').doc(userId).get();
  clientData = clientData.data();
  await firestore.collection('users').doc(userId).set({
    ...clientData as Map,
    'chats': [
      ...clientData['chats'],
      {...userData as Map, 'chatRoomId': chatRoomId}
    ]
  });
  await firestore.collection('users').doc(userData['userId']).set({
    ...userData as Map,
    'chats': [
      ...userData['chats'],
      {...clientData, 'chatRoomId': chatRoomId}
    ]
  });
  await firestore.collection('chatRoom').doc(chatRoomId).set({
    "chatRoomId": chatRoomId,
    'userOneId': userId,
    "userTwoId": userData['userId'],
    "chats":[]
  });
  dynamic myUserData =
      await firestore.collection('users').doc(userData['userId']).get();
  userData = myUserData.data();
}

Future<List> getChatterProfile(String uid,String chatRoomId) async {
  try {
    // var data = await firestore.collection('users').doc(uid).get();
    // chatter = data.data();
    DocumentSnapshot myChatRoom = await firestore.collection('chatRoom').doc(chatRoomId).get();
    chatRoom = myChatRoom.data();

    print('${[chatter,'hello \n', chatRoom]}');
    return [chatter,'hello \n', chatRoom];
  } catch (e) {
    return['the error is \n $e'];
  }
}
