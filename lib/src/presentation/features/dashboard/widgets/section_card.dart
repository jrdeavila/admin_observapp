import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_opservapp/lib.dart';

class PopupableCard<T> extends StatefulWidget {
  final Widget child;
  final List<PopupMenuEntry<T>> popupMenuItems;
  final void Function(T? value) onSelected;
  const PopupableCard({
    super.key,
    required this.child,
    required this.popupMenuItems,
    required this.onSelected,
  });

  @override
  State<PopupableCard<T>> createState() => _PopupableCardState<T>();
}

class _PopupableCardState<T> extends State<PopupableCard<T>> {
  void _showPoppupMenu(TapDownDetails details) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = RelativeRect.fromLTRB(
      details.globalPosition.dx,
      details.globalPosition.dy,
      overlay.size.width - details.globalPosition.dx,
      overlay.size.height - details.globalPosition.dy,
    );
    showMenu<T>(
            context: context, position: position, items: widget.popupMenuItems)
        .then((value) => widget.onSelected(value));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          top: 10.0,
          right: 20.0,
          child: GestureDetector(
            onTapDown: _showPoppupMenu,
            child: Icon(
              FontAwesomeIcons.edit,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback onTap;
  const SectionCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
        width: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl(image),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String imageUrl(String path) {
  if (path.contains("public")) {
    return path.replaceFirst(
        "public", "$baseUrl$sectionsDomainEndpoint/storage");
  }
  return "$baseUrl$sectionsDomainEndpoint/storage/$path";
}

class SectionCardSkeleton extends StatelessWidget {
  const SectionCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Color de fondo gris para el skeleton
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors
                  .grey[400], // Color de fondo gris para la imagen del skeleton
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Container(
              height: 20,
              color: Colors
                  .grey[400], // Color de fondo gris para el título del skeleton
            ),
          ),
        ],
      ),
    );
  }
}
