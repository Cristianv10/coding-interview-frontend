class FiatAssets {
  static const Map<String, String> fiatCurrencyAssets = {
    'VES': 'assets/fiat_currencies/VES.png',
    'COP': 'assets/fiat_currencies/COP.png',
    'PEN': 'assets/fiat_currencies/PEN.png',
    'BRL': 'assets/fiat_currencies/BRL.png',
  };

  static String getAsset(String fiatCurrencyId) {
    return fiatCurrencyAssets[fiatCurrencyId] ??
        'assets/fiat_currencies/VES.png';
  }
}
