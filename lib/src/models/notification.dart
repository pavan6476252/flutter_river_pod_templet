import 'dart:convert';

final List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Tour Booked Successfully',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.tourBooked,
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Exclusive Offers Inside',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.exclusiveOffer,
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Exclusive Offer',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.reviewRequest,
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Tour Booked Accepted',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.reviewRequest,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Exclusive Offers Inside',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.exclusiveOffer,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'New Studio Nearby You',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.alert,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Exclusive Offers Inside',
    message:
        'we’re Checking if the Studio can be seen on .we’re Checking if the Studio can be seen on.',
    type: NotificationType.exclusiveOffer,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
];

final GroupedNotifications groupedNotifications =
    GroupedNotifications.fromList(notifications);
final String jsonString = groupedNotifications.toJsonString();

class GroupedNotifications {
  final List<NotificationDate> notificationDates;

  GroupedNotifications({
    required this.notificationDates,
  });

  factory GroupedNotifications.fromList(List<NotificationModel> notifications) {
    Map<String, List<NotificationModel>> groupedMap = {};

    for (var notification in notifications) {
      final String formattedDate = _formatDate(notification.date);
      if (!groupedMap.containsKey(formattedDate)) {
        groupedMap[formattedDate] = [];
      }
      groupedMap[formattedDate]!.add(notification);
    }

    List<NotificationDate> notificationDates = groupedMap.entries.map((entry) {
      return NotificationDate(
        date: entry.key,
        notifications: entry.value,
      );
    }).toList();

    return GroupedNotifications(notificationDates: notificationDates);
  }

  String toJsonString() {
    List<Map<String, dynamic>> jsonList =
        notificationDates.map((notificationDate) {
      return {
        'date': notificationDate.date,
        'notifications': notificationDate.notifications.map((notification) {
          return {
            'title': notification.title,
            'message': notification.message,
            'type': notification.type.toString().split('.').last,
            'date': notification.date.toIso8601String(),
          };
        }).toList(),
      };
    }).toList();

    return jsonEncode(jsonList);
  }
}

class NotificationDate {
  final String date;
  final List<NotificationModel> notifications;

  NotificationDate({
    required this.date,
    required this.notifications,
  });
}

class NotificationModel {
  final String title;
  final String message;
  final NotificationType type;
  final DateTime date;

  NotificationModel({
    required this.title,
    required this.message,
    required this.type,
    required this.date,
  });
}

enum NotificationType {
  tourBooked,
  exclusiveOffer,
  reviewRequest,
  alert,
}

String _formatDate(DateTime date) {
  final now = DateTime.now();
  if (isSameDay(date, now)) {
    return 'Today';
  } else if (isSameDay(date, now.subtract(const Duration(days: 1)))) {
    return 'Yesterday';
  } else {
    return '${date.day}/${date.month}/${date.year}';
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
