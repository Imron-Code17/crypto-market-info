enum AppIcons {
  btc('assets/icons/btc.png'),
  eth('assets/icons/eth.png'),
  custom(''),

  ///
  ;

  const AppIcons(this.path);
  final String path;

  String val(String path) {
    return path;
  }
}
