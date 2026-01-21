part of "utils.dart";

final String defaultSystemLocale = Platform.localeName.split("_").first;

String get defaultLocale => switch (defaultSystemLocale) {
      "ru" => "ru",
      "en" => "en",
      "uz" => "uz",
      _ => "ru",
    };

String get defaultTheme => SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String priceFormat(num? price) {
  return intl.NumberFormat("#,##0", 'uz').format(price ?? 0).replaceAll(String.fromCharCode(160), " ");
}

String dateFormat(DateTime date) {
  return "${numberFormat(date.day)}.${numberFormat(date.month)}.${date.year}";
}

String dateFormat2(DateTime? date) {
  return intl.DateFormat('d MMMM', localSource.locale).format(date ?? DateTime.now());
}

String numberFormat(int k) {
  if (k > 9) {
    return k.toString();
  } else {
    return "0$k";
  }
}

String phoneFormat(String phone) {
  try {
    return "${phone.substring(0, 4)} ${phone.substring(4, 6)} ${phone.substring(6, 9)} ${phone.substring(9, 11)} ${phone.substring(11, 13)}";
  } catch (e) {
    return phone;
  }
}

bool isTextOverflowed(String text, TextStyle style, double maxWidth, int maxLines) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}

String formatBytes(num bytes) {
  const int kb = 1024;
  const int mb = 1024 * 1024;

  if (bytes >= mb) {
    return "${(bytes / mb).toStringAsFixed(2)} MB";
  } else if (bytes >= kb) {
    return "${(bytes / kb).toStringAsFixed(2)} KB";
  } else {
    return "${bytes.toStringAsFixed(0)} B";
  }
}

bool isUrl(String str) {
  return str.startsWith("http://") || str.startsWith("https://");
}
