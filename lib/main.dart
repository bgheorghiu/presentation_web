import 'package:bogdangheorghiu/launcher.dart';
import 'package:bogdangheorghiu/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bogdan Gheorghiu',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const MyHomePage(title: 'Presentation Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UrlLauncher _launcher = UrlLauncher();
  late AutoScrollController _autoScrollController;
  final Axis scrollDirection = Axis.vertical;

  final double _tabSpacing = 40.0;
  final double _iconsSpacing = 32.0;
  final double _latPadding = 32.0;
  final double _titleSpacing = 20.0;

  bool isExpanded = true;

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    super.initState();
  }

  Future<void> _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WebTheme.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: _latPadding),
                    const Icon(
                      Icons.trip_origin,
                      color: WebTheme.lightColor,
                      size: 48.0,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        _scrollToIndex(0);
                      },
                      child: const Text(
                        'About',
                        style: WebTheme.tabText,
                      ),
                    ),
                    SizedBox(width: _tabSpacing),
                    InkWell(
                      onTap: () {
                        _scrollToIndex(1);
                      },
                      child: const Text(
                        'Experience',
                        style: WebTheme.tabText,
                      ),
                    ),
                    SizedBox(width: _tabSpacing),
                    InkWell(
                      onTap: () {
                        _scrollToIndex(2);
                      },
                      child: const Text(
                        'Work',
                        style: WebTheme.tabText,
                      ),
                    ),
                    SizedBox(width: _tabSpacing),
                    const Text(
                      'Contact',
                      style: WebTheme.tabText,
                    ),
                    SizedBox(width: _tabSpacing),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Resume',
                          style: TextStyle(
                            color: WebTheme.lightColor,
                            letterSpacing: 4.0,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      style: WebTheme.outlinedStyle,
                    ),
                    SizedBox(width: _tabSpacing),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _latPadding + 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            _launcher.launchURL('https://github.com/bgheorghiu');
                          },
                          child: SvgPicture.network(
                            'https://img.icons8.com/material-outlined/96/000000/github.svg',
                            color: WebTheme.mainColor,
                            height: 32.0,
                          ),
                        ),
                        SizedBox(height: _iconsSpacing),
                        InkWell(
                          onTap: () {
                            _launcher.launchURL('https://www.linkedin.com/in/bogdan-gheorghiu-bb46ab132/');
                          },
                          child: SvgPicture.network(
                            'https://img.icons8.com/material-outlined/96/000000/linkedin--v1.svg',
                            color: WebTheme.mainColor,
                            height: 32.0,
                          ),
                        ),
                        SizedBox(height: _iconsSpacing),
                        InkWell(
                          onTap: () {
                            _launcher.launchCaller();
                          },
                          child: const Icon(
                            Icons.phone,
                            color: WebTheme.mainColor,
                          ),
                        ),
                        SizedBox(height: _iconsSpacing),
                        InkWell(
                          onTap: () {
                            _launcher.launchEmail();
                          },
                          child: const Icon(
                            Icons.mail,
                            color: WebTheme.mainColor,
                          ),
                        ),
                        SizedBox(height: _iconsSpacing / 2),
                        Container(
                          width: 1.0,
                          height: _iconsSpacing * 2,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomScrollView(
                      controller: _autoScrollController,
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'Hi, my name is',
                                          style: TextStyle(
                                            color: WebTheme.lightColor,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        SizedBox(height: _titleSpacing),
                                        const Text(
                                          'Bogdan Gheorghiu.',
                                          style: TextStyle(
                                            color: WebTheme.nameColor,
                                            letterSpacing: 4.0,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 56.0,
                                          ),
                                        ),
                                        SizedBox(height: _titleSpacing),
                                        const Text(
                                          'I build beautiful Flutter apps.',
                                          style: TextStyle(
                                            color: WebTheme.nameColor,
                                            letterSpacing: 4.0,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 48.0,
                                          ),
                                        ),
                                        SizedBox(height: _titleSpacing),
                                        const Text(
                                          'I\'m a freelancer based in Craiova, Romania with',
                                          style: WebTheme.subtitle,
                                        ),
                                        const Text(
                                          'experience in developing, testing & designing mobile',
                                          style: WebTheme.subtitle,
                                        ),
                                        const Text(
                                          'and web applications.',
                                          style: WebTheme.subtitle,
                                        ),
                                        SizedBox(height: _titleSpacing * 4.0),
                                        OutlinedButton(
                                          onPressed: () {
                                            _launcher.launchEmail();
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 16.0),
                                            child: Text(
                                              'Get in touch',
                                              style: TextStyle(
                                                color: WebTheme.lightColor,
                                                letterSpacing: 4.0,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          style: WebTheme.outlinedStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: _tabSpacing * 10.0),
                              Row(
                                children: <Widget>[
                                  _wrapScrollTag(
                                    index: 0,
                                    child: const Text(
                                      '01.',
                                      style: TextStyle(
                                        color: WebTheme.lightColor,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _titleSpacing / 2),
                                  const Text(
                                    'About me',
                                    style: TextStyle(
                                      color: WebTheme.nameColor,
                                      letterSpacing: 4.0,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    width: 400.0,
                                    height: 1.0,
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'Hello! I’m Bogdan, a Flutter Developer based in Craiova, Romania.',
                                          style: WebTheme.aboutText,
                                        ),
                                        const SizedBox(height: 48.0),
                                        const Text(
                                          'I am passionate about mobile platforms and translating code into applications that satisfy the client’s needs and requirements. I have experience in Flutter, Firebase SDK and Photoshop.',
                                          style: WebTheme.aboutText,
                                        ),
                                        const SizedBox(height: 48.0),
                                        const Text(
                                          'Shortly, before graduating from University of Polytechnics Bucharest, I’ve done freelancing work with Adobe Photoshop. Then as a student I worked as a Junior QA Analyst for two big companies, Harman International and Bitdefender. The next step was clearly working as a Mobile Developer and since then I started learning Flutter from Google’s Digital Garage for Programmers in 2020. After graduating the course I started working as a freelancer Flutter Developer',
                                          style: WebTheme.aboutText,
                                        ),
                                        const SizedBox(height: 48.0),
                                        const Text(
                                          'Here are a few technologies that I’ve been working recently:',
                                          style: WebTheme.aboutText,
                                        ),
                                        const SizedBox(height: 20.0),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Skill(widgetText: 'Dart'),
                                                Skill(widgetText: 'Flutter'),
                                                Skill(widgetText: 'Firebase'),
                                                Skill(widgetText: 'Redux'),
                                              ],
                                            ),
                                            const SizedBox(width: 300.0),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Skill(widgetText: 'Photoshop'),
                                                Skill(widgetText: 'Python'),
                                                Skill(widgetText: 'Git Actions'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: _tabSpacing * 10.0),
                              Row(
                                children: <Widget>[
                                  _wrapScrollTag(
                                    index: 1,
                                    child: const Text(
                                      '02.',
                                      style: TextStyle(
                                        color: WebTheme.lightColor,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _titleSpacing / 2),
                                  const Text(
                                    'Where I\'ve worked',
                                    style: TextStyle(
                                      color: WebTheme.nameColor,
                                      letterSpacing: 4.0,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    width: 400.0,
                                    height: 1.0,
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'Flutter Developer 2021 - Current',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Flutter Redux - Firebase - Integration Tests - Unit Tests - CI/CD with GIT Actions',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 48.0),
                                    const Text(
                                      'Junior Software Testing Engineer 01.2020 - 02.2021',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Company: HARMAN Romania',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Automation testing - Write and review test cases - Python',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 48.0),
                                    const Text(
                                      'Junior QA Analyst 07.2019 - 09.2019',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Company: Bitdefender',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Python - Linux - Jira - Bitbucket - Testrail - Agile Environment',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 48.0),
                                    const Text(
                                      'Photoshop Designer 09.2015 - 03.2016',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Company: Freelancer.com',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                      'Logo Design - 9 Projects Done - Rating: 4.5/5',
                                      style: TextStyle(
                                        color: WebTheme.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    OutlinedButton(
                                      onPressed: () {
                                        _launcher.launchURL('https://www.freelancer.com/u/Whitey27?w=f');
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.0),
                                        child: Text(
                                          'Click for profile',
                                          style: TextStyle(
                                            color: WebTheme.lightColor,
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      style: WebTheme.outlinedStyle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: _tabSpacing * 10.0),
                              Row(
                                children: <Widget>[
                                  const Text(
                                    '03.',
                                    style: TextStyle(
                                      color: WebTheme.lightColor,
                                      letterSpacing: 3.0,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(width: _titleSpacing / 2),
                                  const Text(
                                    'What I\'ve done',
                                    style: TextStyle(
                                      color: WebTheme.nameColor,
                                      letterSpacing: 4.0,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    width: 400.0,
                                    height: 1.0,
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                              _wrapScrollTag(
                                index: 2,
                                child: const SizedBox(height: 48.0),
                              ),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    'res/images/background.png',
                                    width: MediaQuery.of(context).size.width * 0.48,
                                  ),
                                  const SizedBox(height: 24.0),
                                ],
                              ),
                              const Text(
                                'Screens of my personal projects.',
                                style: WebTheme.aboutText,
                              ),
                              const SizedBox(height: 24.0),
                              const Text(
                                'I have also worked on different apps with Offline Database, Google Maps, Video Recording, QR Scanner.',
                                style: WebTheme.aboutText,
                              ),
                              const SizedBox(height: 100.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _latPadding + 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(
                          width: 1,
                          child: Text(
                            'made',
                            style: WebTheme.nameText,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const SizedBox(
                          width: 1,
                          child: Text(
                            'with',
                            style: WebTheme.nameText,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const SizedBox(
                          width: 1,
                          child: Text(
                            'Flutter',
                            style: WebTheme.nameText,
                          ),
                        ),
                        SizedBox(height: _iconsSpacing / 2),
                        Container(
                          width: 1.0,
                          height: _iconsSpacing * 2,
                          color: Colors.white70,
                        ),
                      ],
                    ),
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

class Skill extends StatelessWidget {
  const Skill({Key? key, required this.widgetText}) : super(key: key);

  final String widgetText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.play_arrow_outlined,
          color: WebTheme.lightColor,
          size: 18.0,
        ),
        Text(
          widgetText,
          style: const TextStyle(
            color: WebTheme.mainColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
