import 'package:get/get.dart';

class LocaleString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'hello':'Prevention is better than cure',
      'message':'Scan Here',
      'title':'Mask Detector',
      'subscribe':'Select From Gallery',
      'changelang':'Reset'
    },
    'hi_IN':{
      'hello': 'रोकथाम इलाज से बेहतर है',
      'message':'यहां स्कैन करें',
      'title':'मुखौटा पता लगानेवाला',
      'subscribe':'गैलरी से चुनें',
      'changelang':'रीसेट'
    },
    'kn_IN':{
      'hello': 'ಚಿಕಿತ್ಸೆಗಿಂತ ತಡೆಗಟ್ಟುವಿಕೆ ಉತ್ತಮವಾಗಿದೆ',
      'message':'ಇಲ್ಲಿ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ',
      'title':'ಮುಖವಾಡ ಕಂಡುಹಿಡಿಯುವವನು',
      'subscribe':'ಗ್ಯಾಲರಿಯಿಂದ ಆಯ್ಕೆಮಾಡಿ',
      'changelang':'ಮರುಹೊಂದಿಸಿ'
    }
  };

}