import 'package:mburger/mburger.dart';

class News {
  final String? image;
  final String title;
  final String content;

  const News({
    this.image,
    required this.title,
    required this.content,
  });

  factory News.fromMBurgerSection(MBSection section) {
    String? image;
    String title = '';
    String content = '';

    section.elements.forEach((key, value) {
      if (key == 'image' && value is MBImagesElement) {
        image = value.firstImage()?.url ?? '';
      } else if (key == 'title' && value is MBTextElement) {
        title = value.value;
      } else if (key == 'content' && value is MBMarkdownElement) {
        content = value.value;
      }
    });

    return News(
      image: image,
      title: title,
      content: content,
    );
  }
}
