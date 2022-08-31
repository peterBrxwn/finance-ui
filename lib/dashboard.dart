import 'package:badges/badges.dart';
import 'package:behance/app_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        leading: IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () => Navigator.pushNamed(context, 'notifications'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(
                "assets/github.png",
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.white,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.repeat,
              size: 18,
              color: AppTheme.lightGrey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                color: const Color(0xffebf8ff),
                width: 48,
                child: DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  dropdownSearchDecoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  dropdownButtonProps: const IconButtonProps(
                    icon: SizedBox.shrink(),
                    iconSize: 0,
                    padding: EdgeInsets.zero,
                  ),
                  items: const ['Send', 'Receive', 'Exchange', 'QR Scan'],
                  popupItemBuilder: (context, text, __) {
                    if (text == 'Send') return const _SendDropdownItem();
                    if (text == 'Receive') return const _ReceiveDropdownItem();
                    if (text == 'Exchange') {
                      return const _ExchangeDropdownItem();
                    }
                    return const _QRScanDropdownItem();
                  },
                  dropdownBuilder: (context, __) {
                    return Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                ),
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.listUl,
              size: 18,
              color: AppTheme.lightGrey,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: AppTheme.lightGrey,
            ),
            label: '',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        onTap: (i) {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Wallet',
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(color: AppTheme.grey),
              ),
              Row(
                children: [
                  Text(
                    'Mobile Team',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppTheme.notBlack),
                  ),
                  const Icon(
                    Icons.unfold_more_outlined,
                    color: AppTheme.iconGrey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const _HorizontalMenu(),
              const SizedBox(height: 25),
              const _ToggleButton(),
              const SizedBox(height: 10),
              const _SearchBar(),
              const SizedBox(height: 10),
              const _VeriticalMenu(),
              const SizedBox(height: 25),
              const _DropDownMenu(),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class _SendDropdownItem extends StatelessWidget {
  const _SendDropdownItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 25,
          child: Divider(
            thickness: 2.5,
            color: AppTheme.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(
                    255,
                    253,
                    246,
                    233,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Color(0xffffc03f),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Send',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppTheme.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReceiveDropdownItem extends StatelessWidget {
  const _ReceiveDropdownItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffe5f3d5),
            ),
            child: const Icon(
              Icons.arrow_circle_down_outlined,
              color: Color(0xff9cd454),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            'Receive',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppTheme.black),
          ),
        ],
      ),
    );
  }
}

class _ExchangeDropdownItem extends StatelessWidget {
  const _ExchangeDropdownItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffefe6fd),
            ),
            child: const Icon(
              Icons.sync_alt_outlined,
              color: Color(0xffae82f6),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            'Exchange',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppTheme.black),
          ),
        ],
      ),
    );
  }
}

class _QRScanDropdownItem extends StatelessWidget {
  const _QRScanDropdownItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffeff3fb),
                ),
                child: const Icon(
                  FontAwesomeIcons.barcode,
                  color: Color(0xff87a3ee),
                  size: 18,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QR Scan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppTheme.black),
                  ),
                  Text(
                    'Invoice, addresses',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppTheme.iconGrey),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        const Icon(
          Icons.disabled_by_default,
          color: AppTheme.notBlack,
        ),
      ],
    );
  }
}

class _HorizontalMenu extends StatelessWidget {
  const _HorizontalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const _ItemCards(
            active: true,
            iconData: Icons.qr_code_2_outlined,
            text: 'Your address',
          ),
          const _ItemCards(
            iconData: Icons.person_outlined,
            text: 'Aliase',
          ),
          _ItemCards(
            iconColor: Theme.of(context).primaryColor,
            iconData: FontAwesomeIcons.toggleOn,
            text: 'Balance',
          ),
          const _ItemCards(
            iconData: FontAwesomeIcons.downLeftAndUpRightToCenter,
            isFa: true,
            text: 'Received',
          ),
        ],
      ),
    );
  }
}

class _ItemCards extends StatelessWidget {
  const _ItemCards({
    required this.iconData,
    required this.text,
    this.active = false,
    this.iconColor,
    this.iconSize,
    this.isFa = false,
    Key? key,
  }) : super(key: key);
  final bool active;
  final Color? iconColor;
  final IconData iconData;
  final double? iconSize;
  final bool isFa;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 113.5,
      child: Card(
        elevation: 3,
        child: Ink(
          decoration: active
              ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      const Color(0xff5a88f9),
                      Theme.of(context).primaryColor,
                    ],
                  ),
                )
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color:
                    active ? AppTheme.lightGrey : iconColor ?? AppTheme.black,
                size: isFa ? 18 : iconSize,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: active ? AppTheme.lightGrey : AppTheme.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Tokens',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 20),
            Text(
              'Leasing',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppTheme.grey),
            ),
          ],
        ),
        SizedBox(
          width: 15,
          child: Divider(
            color: Theme.of(context).primaryColor,
            height: 5,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: TextField(
              cursorHeight: 2,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                fillColor: AppTheme.searchBar,
                filled: true,
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppTheme.searchBar),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppTheme.searchBar),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppTheme.searchBar),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.swap_vert_rounded,
            color: AppTheme.grey,
          ),
        ),
      ],
    );
  }
}

class _VeriticalMenu extends StatelessWidget {
  const _VeriticalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _VeriticalItem(
          badgeIcon: Icons.done_outlined,
          leading: Transform.rotate(
            angle: 15,
            child: Icon(
              FontAwesomeIcons.solidSquareFull,
              color: Theme.of(context).primaryColor,
            ),
          ),
          subtitle: '5.0054',
          title: 'Waves',
          titleIcon: true,
        ),
        const SizedBox(height: 10),
        const _VeriticalItem(
          badgeIcon: Icons.code_outlined,
          leading: _TextIcon(text: 'P', backgroundColor: Color(0xff69717b)),
          subtitle: '1 444.04556321',
          title: 'Pigeon',
          title2: '/My Token',
        ),
        const SizedBox(height: 10),
        const _VeriticalItem(
          badgeIcon: Icons.done_outlined,
          leading: _TextIcon(text: '\$', backgroundColor: Color(0xff49b04c)),
          subtitle: '199.24',
          title: 'US Dollar',
        ),
      ],
    );
  }
}

class _VeriticalItem extends StatelessWidget {
  const _VeriticalItem({
    required this.badgeIcon,
    required this.leading,
    required this.subtitle,
    required this.title,
    this.titleIcon = false,
    this.title2 = '',
    Key? key,
  }) : super(key: key);
  final IconData badgeIcon;
  final Widget leading;
  final String subtitle;
  final String title;
  final bool titleIcon;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(right: 10),
      child: ListTile(
        leading: SizedBox(
          height: double.infinity,
          child: Badge(
            badgeContent: Icon(
              badgeIcon,
              size: 10,
              color: AppTheme.black,
            ),
            badgeColor: AppTheme.white,
            position: BadgePosition.bottomEnd(bottom: 0),
            child: leading,
          ),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppTheme.grey),
            ),
            const SizedBox(width: 3),
            Text(title2, style: Theme.of(context).textTheme.caption),
            titleIcon
                ? Icon(
                    Icons.favorite_outlined,
                    size: 12,
                    color: Theme.of(context).primaryColor,
                  )
                : const SizedBox(),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: AppTheme.notBlack),
        ),
      ),
    );
  }
}

class _TextIcon extends StatelessWidget {
  const _TextIcon({required this.backgroundColor, required this.text, Key? key})
      : super(key: key);
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppTheme.white),
      ),
      backgroundColor: backgroundColor,
    );
  }
}

class _DropDownMenu extends StatelessWidget {
  const _DropDownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: const [
          _DropDownItem(text: 'Hidden tokens (2)'),
          SizedBox(height: 25),
          _DropDownItem(text: 'Suspicious tokens (15)'),
        ],
      ),
    );
  }
}

class _DropDownItem extends StatelessWidget {
  const _DropDownItem({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: AppTheme.grey),
        ),
        Icon(
          Icons.expand_more_outlined,
          color: AppTheme.grey,
          size: Theme.of(context).textTheme.bodyText1!.fontSize,
        ),
      ],
    );
  }
}
