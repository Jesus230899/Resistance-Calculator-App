part of home_view;

// ignore: must_be_immutable
class _HomeMobile extends StatelessWidget {
  final HomeViewModel vM;

  _HomeMobile(this.vM);

  MainProvider _mainProvider;
  @override
  Widget build(BuildContext context) {
    _mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).name),
        // backgroundColor: Colors.black,
      ),
      drawer: _drawer(context),
      body: Center(
        child: Container(child: const Text('Hola mundo')),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       _mainProvider.changeLocale = 'en';
      //       // _mainProvider.changeLocale('en');
      //       print(_mainProvider.locale);
      //     }
      //     // backgroundColor: Colors.black,
      //     ),
    );
  }

  _drawer(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context).created,
                  style: const TextStyle(fontSize: 18)),
              subtitle: const Text('Jesús Alberto Aguilar Martínez'),
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context).changeLanguage),
              subtitle: DropdownButton<String>(
                value: _getValueDropDown(),
                underline: Container(
                  height: 1,
                  color: Colors.transparent,
                ),
                elevation: 16,
                onChanged: (value) => _onChangedDropDowm(
                    value == 'Español' || value == 'Spanish' ? 'es' : 'en'),
                items:
                    vM.languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppLocalizations.of(context).flutterVersion + ': 2.5.3',
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ))
          ],
        ),
      ),
    );
  }

  String _getValueDropDown() {
    if (vM.languages[0] == 'Spanish') {
      return _mainProvider.locale == 'en' ? 'Spanish' : 'English';
    } else {
      return _mainProvider.locale == 'es' ? 'Español' : 'Ingles';
    }
  }

  void _onChangedDropDowm(String value) {
    if (value == 'es') {
      _mainProvider.changeLocale = value;
      vM.changeLanguages = value;
    } else {
      _mainProvider.changeLocale = value;
      vM.changeLanguages = value;
    }
  }
}
