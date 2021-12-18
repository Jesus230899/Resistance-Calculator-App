part of home_view;

// ignore: must_be_immutable
class _HomeMobile extends StatelessWidget {
  final HomeViewModel vM;

  const _HomeMobile(this.vM);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).name),
    );
  }

  // Body
  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context).selectBands,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Row(
              children: [
                _itemRadioButton(4, context),
                _itemRadioButton(5, context),
              ],
            ),
            _listBands(context),
            const Divider(),
            _itemMultiplier(context),
            const SizedBox(height: 30),
            const Text(
              'El valor de la resistencia es: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(vM.resistanceValue + ' Ohms',
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))
            // _resistanceValue(),
          ],
        ),
      ),
    );
  }

  Widget _itemRadioButton(int value, BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: Icon(
            vM.numberBands == value
                ? Icons.radio_button_checked
                : Icons.radio_button_off_outlined,
            color: AppColors.accentColor),
        onTap: () {
          vM.numberBands = value;
          if (value == 5) {
            vM.listBandSelected.add(ColorBandModel());
          } else {
            if (vM.listBandSelected.length == 3) {
              vM.listBandSelected.removeAt(2);
            }
          }
        },
        title: Text('$value ${AppLocalizations.of(context).bands}'),
      ),
    );
  }

  Widget _listBands(BuildContext context) {
    return Column(children: [
      ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vM.numberBands - 2,
        itemBuilder: (context, index) => _itemBand(context, index),
      )
    ]);
  }

  Widget _itemBand(BuildContext context, int index) {
    String name = vM.listBandSelected[index].name;
    TextStyle style = TextStyle(
        color:
            name == 'White' || name == 'Blanco' ? Colors.black : Colors.white);
    return Container(
      color: vM.listBandSelected[index].color ?? Colors.grey[300],
      child: ListTile(
          onTap: () => showCustomDialog(
              context,
              AppLocalizations.of(context).selectColor,
              _colorBandList(context, index)),
          title: name != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: style),
                    Text(vM.listBandSelected[index].value.toString(),
                        style: style),
                  ],
                )
              : Text(
                  '${AppLocalizations.of(context).selectThe} ${index + 1} ${AppLocalizations.of(context).band}')),
    );
  }

  Widget _itemMultiplier(BuildContext context) {
    String name = vM.multiplier?.name;
    TextStyle style = TextStyle(
        color:
            name == 'White' || name == 'Blanco' ? Colors.black : Colors.white);
    return Container(
      color: vM.multiplier.color ?? Colors.grey[300],
      child: ListTile(
          onTap: () => showCustomDialog(
              context,
              AppLocalizations.of(context).selectColor,
              _colorBandList(context, 10)),
          title: name != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: style),
                    Text(_getNameMultiplier(vM.multiplier), style: style),
                  ],
                )
              : const Text('Selecciona un multiplicador')),
    );
  }

  Widget _colorBandList(BuildContext context, int i) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: i != 10 ? 10 : vM.listColorBands.length,
          itemBuilder: (context, index) {
            TextStyle style = TextStyle(
                color: vM.listColorBands[index].name == 'White' ||
                        vM.listColorBands[index].name == 'Blanco'
                    ? Colors.black
                    : Colors.white);
            ColorBandModel colorBand = vM.listColorBands[index];
            return Container(
              color: colorBand.color,
              child: ListTile(
                  onTap: () {
                    i != 10
                        ? vM.changeBandSelected(i, vM.listColorBands[index])
                        : vM.multiplier = vM.listColorBands[index];
                    vM.calculateResistance();
                    Navigator.pop(context);
                  },
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(colorBand.name, style: style),
                        i != 10
                            ? Text(colorBand.value.toString(), style: style)
                            : Text(_getNameMultiplier(colorBand), style: style)
                      ])),
            );
          }),
    );
  }

  String _getNameMultiplier(ColorBandModel colorBand) {
    if (colorBand.name == 'Gold' ||
        colorBand.name == 'Silver' ||
        colorBand.name == 'Oro' ||
        colorBand.name == 'Plata') {
      return "%" +
          colorBand.valueMultiplier.toString() +
          ' ' +
          (colorBand.identifier ?? '');
    } else {
      return "x" +
          colorBand.valueMultiplier.toString() +
          ' ' +
          (colorBand.identifier ?? '');
    }
  }
}
