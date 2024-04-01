import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/assets.gen.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/presentation/widgets/search_text_field.dart';

class IconOptions {
  final double size;
  final BorderRadiusGeometry borderRadius;
  final Color? color;

  const IconOptions({
    this.size = 24,
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  });
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final TextStyle? textStyleTitle;
  final double? titleSpace;
  final TextAlign titleAlign;
  final EdgeInsetsGeometry? titleTextMargin;
  final EdgeInsetsGeometry? searchMargin;
  final double? widthIconBack;
  final String? placeholderSearch;
  final double appBarHeight;
  final double searchHeight;
  final Function()? onSettingsPress;
  final Function()? onBackPress;
  final Function()? onLeadingPress;
  final Function(String)? onSearchValue;
  final String? leadingPath;

  const CustomAppBar({
    Key? key,
    this.appBarTitle,
    this.textStyleTitle,
    this.searchHeight = 40,
    this.onBackPress,
    this.titleTextMargin = const EdgeInsets.symmetric(horizontal: 8),
    this.searchMargin = const EdgeInsets.symmetric(horizontal: 8),
    this.onSettingsPress,
    this.titleAlign = TextAlign.start,
    this.onSearchValue,
    this.titleSpace = 0,
    this.widthIconBack = 40,
    this.placeholderSearch,
    this.appBarHeight = kToolbarHeight,
    this.leadingPath,
    this.onLeadingPress,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;

  void _toggleSearch() {
    if (_isSearching == false) {
      widget.onSearchValue!('');
    }
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.backgroundAppbar,
      leading: _buildLeading(),
      titleSpacing: widget.titleSpace,
      leadingWidth: widget.widthIconBack,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: !_isSearching ? _buildTitle() : _buildSearch(),
      ),
      actions: _buildActions(),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: widget.titleTextMargin,
      width: double.infinity,
      child: Text(
        widget.appBarTitle ?? '',
        textAlign: widget.titleAlign,
        style: widget.textStyleTitle,
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      width: double.infinity,
      height: widget.searchHeight,
      alignment: Alignment.center,
      padding: widget.searchMargin,
      child: SearchField(
        onSearchValue: (value) {
          if (widget.onSearchValue != null) {
            widget.onSearchValue!(value);
          }
        },
        placeholder: widget.placeholderSearch ?? 'Search movies...',
      ),
    );
  }

  List<Widget>? _buildActions() {
    return [
      if (widget.onSearchValue != null)
        _buildItemAction(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            _isSearching
                ? Assets.icons.svg.icCloseSeach.path
                : Assets.icons.svg.icSearch.path,
            fit: BoxFit.contain,
          ),
          onTap: _toggleSearch,
        ),
      if (!_isSearching && widget.onSettingsPress != null)
        _buildItemAction(
          padding: const EdgeInsets.only(right: 16),
          child: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 24,
          ),
          onTap: widget.onSettingsPress,
        ),
    ];
  }

  Widget _buildItemAction({
    required EdgeInsetsGeometry padding,
    Widget? child,
    Function()? onTap,
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onTap: onTap,
        child: child,
      ),
    );
  }

  Widget? _buildLeading() {
    if (widget.leadingPath != null) {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 0),
        child: InkWell(
          onTap: () => widget.onLeadingPress!(),
          child: SvgPicture.asset(
            widget.leadingPath!,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    } else if (widget.onBackPress != null) {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 0),
        child: InkWell(
          onTap: () => widget.onBackPress!(),
          child: SvgPicture.asset(
            Assets.icons.svg.icBack.path,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
