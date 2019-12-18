class IrCommand{
  final pattern;
  const IrCommand(this.pattern);

  static const v1 = IrCommand([9300,4650,655,610,675,565,700,550,700,550,695,1605,665,565,700,550,700,550,695,1610,670,1615,635,1615,630,1625,625,575,700,1600,650,1615,635,1615,630,570,700,1600,650,565,700,550,700,1600,675,565,700,550,700,550,695,1610,670,565,700,1600,650,1615,635,565,700,1600,655,1610,635,1615,635]);
  static const v2 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,645,1610,620,1630,625,575,700,1600,650,1600,645,1605,625,575,700,1600,650,1600,645,555,700,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,1600,700,550,700,1600,650,1600,650,1600,645]);
  static const rev = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,625,1625,615,585,700,1600,650,1600,645,1605,630,570,700,550,700,1600,700,550,700,1600,650,550,700,550,700,550,700,1600,700,1600,650,550,700,1600,650,550,700,1600,650,1600,650,1600,645]);
  static const v3 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,605,1645,600,600,700,1600,650,1600,630,1620,610,590,700,1600,650,550,700,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,1600,650,550,700,550,700,1600,700,1600,650,1600,640]);
  static const t1 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,640,1610,600,1650,600,600,700,1600,650,1600,630,1620,605,1650,600,1660,600,600,700,550,700,1600,700,550,700,550,700,550,700,550,700,550,700,1600,700,1600,650,550,700,1600,650,1600,650,1600,640]);
  static const t2 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,1600,650,550,700,550,700,550,700,1600,700,1600,650,1600,650,550,700,550,700,1600,700,1600,650,1600,650]);
  static const t4 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650]);
  static const t8 = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,550,700,1600,650,1600,650,1600,650]);
  static const luz = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,645,1605,645,555,700,1600,650,1600,650,1600,645,1605,645,1605,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,550,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650]);
  static const desliga = IrCommand([9300,4650,650,600,700,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,1600,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,550,700,1600,650,1600,650,1600,650,1600,650,550,700,550,700,550,700,1600,700,550,700,550,700,550,700,550,700,1600,700,1600,650,1600,650]);
}