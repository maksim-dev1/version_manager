import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Топ языков устройств: ранговый список с прогресс-барами.
class GeoStatisticsChart extends StatelessWidget {
  final GeoStatisticsResponse data;

  const GeoStatisticsChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.locales.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных по языкам',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    final sorted = List<LocaleStatisticsEntry>.from(data.locales)
      ..sort((a, b) => b.userCount.compareTo(a.userCount));
    final display = sorted.take(5).toList();
    final maxCount = display.first.userCount;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...display.asMap().entries.map((e) {
              final rank = e.key + 1;
              final locale = e.value;
              final relShare = maxCount > 0 ? locale.userCount / maxCount : 0.0;
              final color = _colorForRank(rank, colorScheme);
              final flag = _flagEmoji(locale.locale);
              final langName = _langName(locale.locale);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    // Rank badge (medal for top 3)
                    if (rank <= 3)
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Center(
                          child: Text(
                            rank == 1
                                ? '🥇'
                                : rank == 2
                                ? '🥈'
                                : '🥉',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              '$rank',
                              style: textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 6),
                    // Flag + locale code
                    Text(
                      flag,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    // Language name + locale code
                    SizedBox(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            langName,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            locale.locale,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Progress bar
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: relShare,
                          minHeight: 7,
                          backgroundColor: colorScheme.outlineVariant
                              .withValues(alpha: 0.35),
                          color: color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Count + percentage
                    SizedBox(
                      width: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _fmt(locale.userCount),
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${locale.percentage.toStringAsFixed(1)}%',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _colorForRank(int rank, ColorScheme cs) {
    if (rank == 1) return cs.primary;
    if (rank <= 3) return cs.primary.withValues(alpha: 0.75);
    if (rank <= 6) return cs.primary.withValues(alpha: 0.55);
    return cs.primary.withValues(alpha: 0.35);
  }

  static String _fmt(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }

  // Returns a country-flag emoji for a locale/language code.
  static String _flagEmoji(String locale) {
    final lower = locale.toLowerCase();
    // Try to extract country code after underscore (e.g. en_US → US)
    final parts = lower.split(RegExp(r'[_\-]'));
    final country = parts.length >= 2 ? parts[1].toUpperCase() : '';
    if (country.length == 2) {
      return _countryToFlag(country);
    }
    // Fallback: map language code to a common country
    final lang = parts.first;
    const langToCountry = {
      'ru': 'RU',
      'en': 'US',
      'zh': 'CN',
      'de': 'DE',
      'fr': 'FR',
      'es': 'ES',
      'pt': 'BR',
      'ja': 'JP',
      'ko': 'KR',
      'ar': 'SA',
      'it': 'IT',
      'pl': 'PL',
      'tr': 'TR',
      'nl': 'NL',
      'uk': 'UA',
      'cs': 'CZ',
      'sv': 'SE',
      'fi': 'FI',
      'nb': 'NO',
      'da': 'DK',
      'he': 'IL',
      'th': 'TH',
      'id': 'ID',
      'vi': 'VN',
      'hi': 'IN',
    };
    final mapped = langToCountry[lang] ?? '';
    return mapped.isNotEmpty ? _countryToFlag(mapped) : '🌐';
  }

  static String _countryToFlag(String countryCode) {
    if (countryCode.length != 2) return '🌐';
    final offset = 0x1F1E6 - 0x41; // regional indicator offset
    final chars = countryCode.toUpperCase().codeUnits;
    return String.fromCharCode(chars[0] + offset) +
        String.fromCharCode(chars[1] + offset);
  }

  static String _langName(String locale) {
    final lang = locale.toLowerCase().split(RegExp(r'[_\-]')).first;
    const names = {
      'ru': 'Русский',
      'en': 'English',
      'zh': '中文',
      'de': 'Deutsch',
      'fr': 'Français',
      'es': 'Español',
      'pt': 'Português',
      'ja': '日本語',
      'ko': '한국어',
      'ar': 'العربية',
      'it': 'Italiano',
      'pl': 'Polski',
      'tr': 'Türkçe',
      'nl': 'Nederlands',
      'uk': 'Українська',
      'cs': 'Čeština',
      'sv': 'Svenska',
      'fi': 'Suomi',
      'nb': 'Norsk',
      'da': 'Dansk',
      'he': 'עברית',
      'th': 'ภาษาไทย',
      'id': 'Indonesia',
      'vi': 'Tiếng Việt',
      'hi': 'हिन्दी',
    };
    return names[lang] ?? locale;
  }
}
