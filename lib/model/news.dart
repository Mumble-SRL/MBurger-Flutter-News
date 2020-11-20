import 'package:mburger/elements/mb_markdown_element.dart';
import 'package:mburger/mburger.dart';

class News {
  String image;
  String title;
  String content;

  News.fromMBurgerSection(MBSection section) {
    section.elements.forEach((key, value) {
      if (key == 'image' && value is MBImagesElement) {
        image = value.firstImage()?.url;
      } else if (key == 'title' && value is MBTextElement) {
        title = value.value;
      } else if (key == 'content' && value is MBMarkdownElement) {
        content = value.value;
      }
    });
  }
}
