import 'package:flutter/foundation.dart';
String buildWhatsappUrl() {
  const phone = '918948426729';
  const message = 'Hi Javed, I visited your portfolio and would like to connect.';
  final encodedMessage = Uri.encodeComponent(message);

  if (kIsWeb) {
    return 'https://web.whatsapp.com/send?phone=$phone&text=$encodedMessage';
  } else {
    return 'https://wa.me/$phone?text=$encodedMessage';
  }
}