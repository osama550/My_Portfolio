import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/content_container.dart';
import 'package:my_portfolio/features/home/presentation/widgets/about_me/about_me_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/approach/approach_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/contact/contact_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/hero_intro_text.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/hero_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/projects/projects_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_app_bar.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_drawer.dart';
import 'package:my_portfolio/features/home/presentation/widgets/technical_skills/technical_skills_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/work_experience/work_experience_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _navItems = [
    'Home',
    'Portfolio',
    'History',
    'Skills',
    'About Me',
    'Contact',
  ];
  static const int _home = 0;
  static const int _portfolio = 1;
  static const int _contact = 5;

  static const String _resumeUrl = 'https://flowcv.com/resume/4fhn0icdnq';
  static const String _githubUrl = 'https://github.com/osama550';
  static const String _linkedinUrl =
      'https://www.linkedin.com/in/osama-kamel-elsalamony';
  static const String _email = 'osamakamel758@gmail.com';
  static const String _shalehiUrl =
      'https://play.google.com/store/apps/details?id=com.app.shalehi&pcampaignid=web_share';

  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(
    _navItems.length,
    (_) => GlobalKey(),
  );
  final ValueNotifier<int> _activeIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateActiveSection)
      ..dispose();
    _activeIndex.dispose();
    super.dispose();
  }

  /// Highlights the last section whose top has passed 45% of the viewport.
  void _updateActiveSection() {
    final threshold = MediaQuery.sizeOf(context).height * 0.45;
    var active = 0;
    for (var i = 0; i < _sectionKeys.length; i++) {
      final box = _sectionKeys[i].currentContext?.findRenderObject();
      if (box is! RenderBox || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= threshold) active = i;
    }
    _activeIndex.value = active;
  }

  void _scrollToSection(int index) {
    final box = _sectionKeys[index].currentContext?.findRenderObject();
    if (box is! RenderBox || !_scrollController.hasClients) return;

    final viewport = RenderAbstractViewport.of(box);
    final position = _scrollController.position;
    final target = index == _home
        ? 0.0
        : viewport.getOffsetToReveal(box, 0).offset - 24;
    _scrollController.animateTo(
      target.clamp(position.minScrollExtent, position.maxScrollExtent),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sectionTop = context.fluid(64, 9, 112);

    return Scaffold(
      appBar: ResponsiveAppBar(
        navItems: _navItems,
        activeIndex: _activeIndex,
        onNavItemTap: _scrollToSection,
        onHireMePressed: () => launchEmail(_email),
      ),
      endDrawer: context.isWideNav
          ? null
          : ResponsiveDrawer(
              navItems: _navItems,
              activeIndex: _activeIndex,
              onNavItemTap: _scrollToSection,
              onHireMePressed: () => launchEmail(_email),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeroSection(
              key: _sectionKeys[_home],
              intro: HeroIntroText(
                onViewProjectsPressed: () => _scrollToSection(_portfolio),
                onDownloadCVPressed: () => launchExternalUrl(_resumeUrl),
                onGetInTouchPressed: () => _scrollToSection(_contact),
                onGithubPressed: () => launchExternalUrl(_githubUrl),
                onLinkedinPressed: () => launchExternalUrl(_linkedinUrl),
                onEmailPressed: () => launchEmail(_email),
                onShalehiPressed: () => launchExternalUrl(_shalehiUrl),
              ),
            ),
            const ApproachSection(),
            ContentContainer(
              top: sectionTop,
              child: ProjectsSection(key: _sectionKeys[1]),
            ),
            ContentContainer(
              top: sectionTop,
              child: WorkExperienceSection(key: _sectionKeys[2]),
            ),
            ContentContainer(
              top: sectionTop,
              child: TechnicalSkillsSection(key: _sectionKeys[3]),
            ),
            ContentContainer(
              top: sectionTop,
              child: AboutMeSection(key: _sectionKeys[4]),
            ),
            ContentContainer(
              top: sectionTop,
              bottom: context.fluid(32, 5, 56),
              child: ContactSection(
                key: _sectionKeys[_contact],
                onBackToTop: () => _scrollToSection(_home),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
