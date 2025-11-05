import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  final List<String> spotlightImages = [
    'https://i.pinimg.com/736x/98/d4/e3/98d4e3c28316349f3f7ccc976929e986.jpg',
    'https://i.pinimg.com/1200x/e9/ec/f6/e9ecf6ffe3348572b8e3168c6b0d7de1.jpg',
    'https://i.pinimg.com/736x/d2/e5/9f/d2e59fbc03e69e90d15652e84e589ab9.jpg',
    'https://i.pinimg.com/736x/d6/b8/67/d6b86780eab27a3d09219f87b111f8e9.jpg',
    'https://i.pinimg.com/736x/c0/7c/9d/c07c9d7af24c1c03a67fff2f9835c363.jpg',
    'https://i.pinimg.com/736x/bf/7f/46/bf7f4627901119703406d479bedf1928.jpg',
  ];

  final List<String> imagePool = [
    'https://picsum.photos/id/1011/800/1200',
    'https://picsum.photos/id/1012/400/400',
    'https://picsum.photos/id/1013/400/400',
    'https://picsum.photos/id/1014/400/400',
    'https://picsum.photos/id/1015/600/600',
    'https://picsum.photos/id/1016/600/600',
    'https://picsum.photos/id/1018/600/600',
    'https://picsum.photos/id/1020/600/600',
    'https://picsum.photos/id/1024/600/600',
    'https://picsum.photos/id/1025/600/600',
    'https://picsum.photos/id/1026/600/600',
    'https://picsum.photos/id/1027/600/600',
    'https://picsum.photos/id/1035/600/600',
    'https://picsum.photos/id/1033/600/900',
    'https://picsum.photos/id/1041/800/1200',
    'https://picsum.photos/id/1050/800/1200',
  ];

  late final AnimationController _shimmerController;
  final ScrollController _scrollController = ScrollController();
  final List<DateTime> _sections = [];
  final Map<DateTime, bool> _sectionLoaded = {};
  bool _initialLoaded = false;
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat();
    _initSections();
    _scrollController.addListener(_onScroll);
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _initialLoaded = true;
        });
        _shimmerController.stop();
      }
    });
  }

  void _initSections() {
    DateTime dt = DateTime.now();
    for (int i = 0; i < 5; i++) {
      final day = DateTime(dt.year, dt.month, dt.day).subtract(Duration(days: i));
      _sections.add(day);
      _sectionLoaded[day] = true;
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 400 && !_loadingMore) {
      _loadMoreSections();
    }
  }

  Future<void> _loadMoreSections() async {
    _loadingMore = true;
    final oldest = _sections.isNotEmpty ? _sections.last : DateTime.now();
    List<DateTime> newDays = [];
    for (int i = 1; i <= 3; i++) {
      final day = oldest.subtract(Duration(days: i));
      newDays.add(day);
      _sectionLoaded[day] = false;
    }
    setState(() {
      _sections.addAll(newDays);
    });
    await Future.delayed(const Duration(seconds: 1));
    for (var d in newDays) {
      _sectionLoaded[d] = true;
    }
    _loadingMore = false;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _labelFor(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(date.year, date.month, date.day);
    final diff = today.difference(d).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final wd = weekdays[d.weekday % 7];
    final m = months[d.month - 1];
    return '$wd, ${d.day} $m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: RawScrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 6,
          radius: const Radius.circular(10),
          thumbColor: Colors.grey.shade700,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFF121212),
                pinned: false,
                floating: false,
                snap: false,
                title: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 125,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.cloud_done_outlined, color: Colors.white, size: 12),
                    const SizedBox(width: 5),
                    Text("Backup complete", style: GoogleFonts.poppins(fontSize: 12, color: Colors.white))
                  ]),
                ),
                actions: [
                  InkWell(onTap: () => _showSnack("Add tapped"), borderRadius: BorderRadius.circular(100), child: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.add, color: Color.fromARGB(255, 221, 220, 220)))),
                  const SizedBox(width: 10),
                  InkWell(onTap: () => _showSnack("Notifications tapped"), borderRadius: BorderRadius.circular(20), child: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.notifications, color: Color.fromARGB(255, 221, 220, 220)))),
                  const SizedBox(width: 10),
                  InkWell(onTap: () => _showSnack("Profile tapped"), borderRadius: BorderRadius.circular(30), radius: 25, child: const CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://i.pinimg.com/736x/b9/e0/84/b9e084f1e570e87b48e63087967365c3.jpg"))),
                  const SizedBox(width: 10),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: spotlightImages.map((img) => _spotlightWithShimmer(img)).toList())),
                    ),
                  ),
                ),
              ),
              for (var section in _sections) ...[
                SliverToBoxAdapter(child: _sectionHeader(_labelFor(section))),
                SliverToBoxAdapter(child: _sectionGrid(section)),
                SliverToBoxAdapter(child: const SizedBox(height: 10)),
              ],
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                      child: _loadingMore
                          ? Row(mainAxisSize: MainAxisSize.min, children: const [SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)), SizedBox(width: 10), Text("Loading older photos", style: TextStyle(color: Colors.white))])
                          : const SizedBox.shrink()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String txt) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(txt, style: const TextStyle(color: Color.fromARGB(255, 221, 220, 220), fontSize: 18, fontWeight: FontWeight.w500)),
        Row(children: const [Icon(Icons.check_circle_outline, color: Color.fromARGB(255, 221, 220, 220), size: 20), SizedBox(width: 10), Icon(Icons.more_vert, color: Color.fromARGB(255, 221, 220, 220), size: 20)])
      ]),
    );
  }

  Widget _spotlightWithShimmer(String img) {
    return Container(
      height: 200,
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: _initialLoaded
            ? Stack(children: [
                Image.network(img, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                Positioned.fill(child: Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.35)])))),
                const Positioned(left: 10, bottom: 10, child: Text("Spotlight", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500))),
              ])
            : Shimmer(animation: _shimmerController, baseColor: Colors.grey.shade800, highlightColor: Colors.grey.shade700, child: Container(color: Colors.grey.shade800)),
      ),
    );
  }

  Widget _sectionGrid(DateTime section) {
    final seeded = section.microsecondsSinceEpoch;
    final rnd = Random(seeded);
    final shuffled = List<String>.from(imagePool)..shuffle(rnd);
    final displayImages = shuffled.take(6).toList();
    final bool loaded = _sectionLoaded[section] ?? false;
    return LayoutBuilder(builder: (context, constraints) {
      final double width = constraints.maxWidth;
      int crossAxisCount;
      if (width > 1200) {
        crossAxisCount = 6;
      } else if (width > 900) {
        crossAxisCount = 5;
      } else if (width > 600) {
        crossAxisCount = 4;
      } else {
        crossAxisCount = 3;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: List.generate(displayImages.length, (index) {
            final double mainAxisCellCount = rnd.nextBool() ? 1.0 : 2.0;
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: mainAxisCellCount,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: loaded
                    ? Image.network(displayImages[index], fit: BoxFit.cover)
                    : Shimmer(animation: _shimmerController, baseColor: Colors.grey.shade800, highlightColor: Colors.grey.shade700, child: Container(color: Colors.grey.shade800)),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _showSnackBar(String text) {
    return Text(text, style: const TextStyle(color: Colors.white));
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: _showSnackBar(msg), backgroundColor: Colors.grey[850]));
  }
}

class Shimmer extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Color baseColor;
  final Color highlightColor;
  const Shimmer({required this.child, required this.animation, required this.baseColor, required this.highlightColor, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final double slide = (animation.value * 2) - 1;
        return ShaderMask(
          shaderCallback: (rect) {
            final width = rect.width;
            final gradientWidth = width / 2;
            final center = width * (0.5 + slide * 0.5);
            return LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [baseColor, highlightColor, baseColor], stops: [
              (center - gradientWidth) / width,
              center / width,
              (center + gradientWidth) / width
            ]).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
    );
  }
}
