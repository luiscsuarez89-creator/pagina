import 'service_item.dart';

class ServiceCategory {
  final String title;
  final String description;
  final List<ServiceItem> items;

  const ServiceCategory({
    required this.title,
    required this.description,
    required this.items,
  });
}
