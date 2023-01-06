import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    String uid = DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    String uname = DateTime.now().toUtc().millisecondsSinceEpoch.toString().substring(DateTime.now().toUtc().millisecondsSinceEpoch.toString().length - 5);
    String dp = "https://picsum.photos/200/200?random=${DateTime.now().toUtc().millisecondsSinceEpoch.toString().substring(DateTime.now().toUtc().millisecondsSinceEpoch.toString().length - 2)}";

    return ZegoUIKitPrebuiltCall(
      appID: 2048479123,
      appSign: "c3de3b988cb6e37cd6f58c3382e12a8f99d7a076dbff74c5b3df3898797850f6",
      userID: uid,
      userName: uname,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
          return Container(decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(dp))));
        }
        ..layout = ZegoLayout.pictureInPicture(showMyViewWithVideoOnly: false, isSmallViewDraggable: false, switchLargeOrSmallViewByClick: false)
        ..onOnlySelfInRoom = (context) {
          Navigator.of(context).pop();
        }
        ..audioVideoViewConfig = ZegoPrebuiltAudioVideoViewConfig(
            showAvatarInAudioMode: true,
            showMicrophoneStateOnView: true,
            showCameraStateOnView: false,
            showUserNameOnView: true,
            showSoundWavesInAudioMode: true,
            useVideoViewAspectFill: false,
            backgroundBuilder: (context, size, user, extraInfo) => const Placeholder(),
            foregroundBuilder: (context, size, user, extraInfo) => const Center(child: FlutterLogo()))
        ..bottomMenuBarConfig = ZegoBottomMenuBarConfig(style: ZegoMenuBarStyle.light, hideAutomatically: false, hideByClick: false, maxCount: 3, buttons: [
          // ZegoMenuBarButtonName.toggleCameraButton,
          // ZegoMenuBarButtonName.switchCameraButton,
          ZegoMenuBarButtonName.toggleMicrophoneButton,
          ZegoMenuBarButtonName.hangUpButton,
          ZegoMenuBarButtonName.switchAudioOutputButton
        ])
        // ..onHangUp = () {
        //   if (kDebugMode) print("Tata ByBY");
        // }
        ..turnOnCameraWhenJoining = false
        ..turnOnMicrophoneWhenJoining = true
        ..useSpeakerWhenJoining = true,
    );
  }
}
