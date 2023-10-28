import 'package:flutter/material.dart';
import 'package:mobile_opservapp/src/presentation/features/features.dart';

class DashboardSection {
  final String title;
  final List<Widget> children;
  final Icon icon;
  final bool isExpanded;
  final bool isEndSection;
  final bool isIndexable;
  final VoidCallback? onTap;

  DashboardSection({
    required this.title,
    required this.children,
    required this.icon,
    this.isExpanded = false,
    this.isEndSection = false,
    this.isIndexable = true,
    this.onTap,
  }) : assert(!isIndexable && onTap != null || isIndexable && onTap == null);
}

class DashboardView extends StatefulWidget {
  final List<DashboardSection> sections;
  const DashboardView({super.key, required this.sections});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late int _currentSectionIndex;
  late List<Widget> children;
  late String title;

  @override
  void initState() {
    super.initState();
    _currentSectionIndex = 0;
    _updateChildren();
    _updateTitle();
  }

  void _updateChildren() {
    children = widget.sections[_currentSectionIndex].children;
  }

  void _updateTitle() {
    title = widget.sections[_currentSectionIndex].title;
  }

  void _handleOnChangeSection(int index) {
    _currentSectionIndex = index;
    setState(() {
      _updateChildren();
      _updateTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildDashboardSidebar(context),
      Expanded(
        child: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          height: double.infinity,
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kToolbarHeight + 16),
                _buildTopBar(),
                const SizedBox(height: 20),
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                ...children,
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  SizedBox _buildTopBar() {
    return SizedBox(
      child: Row(
        children: [
          Image.asset(
            "assets/img/small_logo.png",
            height: 50,
          ),
          const Spacer(),
          const UserAccountTag(),
        ],
      ),
    );
  }

  Container _buildDashboardSidebar(BuildContext context) {
    Widget buildItemCallback(DashboardSection e) {
      if (e.isIndexable) {
        return GestureDetector(
          onTap: () {
            final index = widget.sections.indexOf(e);
            _handleOnChangeSection(index);
          },
          child: e.icon,
        );
      } else {
        return GestureDetector(
          onTap: () {
            e.onTap!();
          },
          child: e.icon,
        );
      }
    }

    return Container(
      width: 70,
      padding: const EdgeInsets.only(top: kToolbarHeight + 16),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          ...widget.sections
              .where((element) => !element.isEndSection)
              .map((e) => [
                    buildItemCallback(e),
                    const SizedBox(height: 20),
                  ])
              .expand((element) => element)
              .toList(),
          const Spacer(),
          ...widget.sections
              .where((element) => element.isEndSection)
              .map((e) => [
                    buildItemCallback(e),
                    const SizedBox(height: 20),
                  ])
              .expand((element) => element)
              .toList(),
        ],
      ),
    );
  }
}
