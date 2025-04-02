part of '../../yandex_mapkit_lite.dart';

/// Map logo alignment.
class CustomMapAlignment extends Equatable {
  const CustomMapAlignment({
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  List<Object> get props => <Object>[
        left,
        right,
        top,
        bottom,
      ];

  @override
  bool get stringify => false;

  Map<String, dynamic> toJson() {
    return {
      'left': left,
      'right': right,
      'top': top,
      'bottom': bottom,
    };
  }
}
