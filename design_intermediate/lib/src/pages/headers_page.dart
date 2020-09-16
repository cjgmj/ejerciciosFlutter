import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:design_intermediate/src/theme/theme.dart';
import 'package:design_intermediate/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(body: HeaderWave(color: currentTheme.accentColor));
  }
}
