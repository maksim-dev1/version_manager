import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version_manager_client/version_manager_client.dart';

class StoreLinkCard extends StatelessWidget {
  final StoreLinks storeLink;
  final VoidCallback? onDelete;

  const StoreLinkCard({
    super.key,
    required this.storeLink,
    this.onDelete,
  });

  IconData _getStoreIcon() {
    return switch (storeLink.store) {
      Store.google_play => Icons.shop_rounded,
      Store.app_store => Icons.apple_rounded,
      Store.ru_store => Icons.store_rounded,
      Store.unknown => Icons.link_rounded,
    };
  }

  String _getStoreName() {
    return switch (storeLink.store) {
      Store.google_play => 'Google Play',
      Store.app_store => 'App Store',
      Store.ru_store => 'RuStore',
      Store.unknown => 'Неизвестно',
    };
  }

  Color _getStoreColor(ColorScheme colorScheme) {
    return switch (storeLink.store) {
      Store.google_play => Colors.green,
      Store.app_store => Colors.blue,
      Store.ru_store => Colors.orange,
      Store.unknown => colorScheme.surfaceContainerHighest,
    };
  }

  Future<void> _launchUrl() async {
    final uri = Uri.parse(storeLink.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final storeColor = _getStoreColor(colorScheme);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: storeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getStoreIcon(),
            color: storeColor,
            size: 24,
          ),
        ),
        title: Text(_getStoreName()),
        subtitle: Text(
          storeLink.url,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.open_in_new_rounded),
              onPressed: _launchUrl,
              tooltip: 'Открыть',
            ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: onDelete,
                tooltip: 'Удалить',
              ),
          ],
        ),
      ),
    );
  }
}
