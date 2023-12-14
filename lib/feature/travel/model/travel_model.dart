class TravelModel {
  final String title;
  final String subTitle;
  final String imageName;
  final bool? isBookmarked;

  TravelModel({required this.title, required this.subTitle, required this.imageName, this.isBookmarked = false});

  TravelModel copyWith({String? title, String? subTitle, String? imageName, bool? isBookmarked}) {
    return TravelModel(
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        imageName: imageName ?? this.imageName,
        isBookmarked: isBookmarked ?? this.isBookmarked);
  }

  String get imagePath => 'assets/images/img_$imageName.png';

  static final List<TravelModel> mockItmes = [
    TravelModel(title: 'Sapporo Tower', subTitle: 'Sopporo Tower', imageName: 'discover', isBookmarked: false),
    TravelModel(title: 'Osaka Castle', subTitle: 'Japan', imageName: 'dest', isBookmarked: false),
    TravelModel(title: 'Costentino', subTitle: 'Cosentinonoto', imageName: 'cosentino', isBookmarked: true),
  ];
}
