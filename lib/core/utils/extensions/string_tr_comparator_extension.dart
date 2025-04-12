extension StringTrComparatorExtension on List {
  static final List<String> _turkishAlphabet = [
    'a',
    'b',
    'c',
    'ç',
    'd',
    'e',
    'f',
    'g',
    'ğ',
    'h',
    'ı',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'ö',
    'p',
    'r',
    's',
    'ş',
    't',
    'u',
    'ü',
    'v',
    'y',
    'z',
  ];
  void sortTurkish() {
    sort(turkishCompare);
  }

  int turkishCompare(dynamic a, dynamic b) {
    a as String;
    b as String;
    // Büyük-küçük harfleri birleştirmek için lowercase'e çeviriyoruz.
    a = a.toLowerCase();
    b = b.toLowerCase();

    // Harf harf karşılaştır
    final int minLen = a.length < b.length ? a.length : b.length;
    for (int i = 0; i < minLen; i++) {
      final charA = a[i];
      final charB = b[i];

      // Her iki karakterin de Türk alfabesindeki index'ini alıyoruz
      final indexA = _turkishAlphabet.indexOf(charA);
      final indexB = _turkishAlphabet.indexOf(charB);

      // Alfabede tanımlanamayan (ör. sembol veya rakam) bir karakter gelirse
      // ya en başa ya da en sona atmak isterseniz burada kontrol edebilirsiniz.
      if (indexA == -1 && indexB == -1) {
        // İkisi de tanımlı değilse, normal compareTo uygulanabilir.
        continue;
      } else if (indexA == -1) {
        // A tanımsızsa ve B tanımlıysa, B önce gelsin
        return 1;
      } else if (indexB == -1) {
        // B tanımsızsa ve A tanımlıysa, A önce gelsin
        return -1;
      }

      // Eğer karakterler aynı değilse, farkı döndür
      if (indexA != indexB) {
        return indexA.compareTo(indexB);
      }
    }

    // Buraya geldiysek birisi diğerinin prefix'i olabilir; uzunlukla karar verelim
    return a.length.compareTo(b.length);
  }
}
