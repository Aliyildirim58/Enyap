import 'package:flutter/foundation.dart';
import 'package:loginpage/model/cart.dart';

class Cartstate with ChangeNotifier {
  List<Cart> _carts = [
    Cart("Sarı Şeritlerin İhlal Edilmesi",
        "Ben arkadaşımın yanındayken onun istediği yere gitmesine yardımcı oluyorum.Ancak ailemin yanına gittiğimde yalnız kalıyor. İstanbul gibi büyük bir şehirde yalnız başına markete dahi gitmekte sorun yaşıyor."),
    Cart("Müşteriler ile Yaşadığım İletişim Sorunu",
        "Engelli bir birey olarak sosyal yaşantıma adapte olabildim. Ancak iş yaşantımda ufak sıkıntılarla karşılaşıyorum. Bazı müşterilerle iletişimde sıkıntı çekiyorum."),
    Cart("Akyaka'daki Soyunma Kabini Sorunu",
        "Engelli bir birey olarak iş hayatıma adapte olabildim. Ancak sosyal yaşantımda ufak sıkıntılarla karşılaşıyorum. Örneğin tatil beldelerine yüzmeye giderken sıkıntı çekiyorum."),
  ];

  List<Cart> get carts => _carts;

  Cart get currentCart => _carts.first;

  add(Cart cart) {
    _carts.insert(0, cart);

    notifyListeners();
  }
}
