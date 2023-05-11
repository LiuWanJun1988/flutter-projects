import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            title: 'Home',
            iconData: Icons.home,
            onTap: () {},
          ),
          _SideMenuIconTab(
            title: 'Search',
            iconData: Icons.search,
            onTap: () {},
          ),
          _SideMenuIconTab(
            title: 'Radio',
            iconData: Icons.radio,
            onTap: () {},
          ),
          const SizedBox(height: 12.0,),
          _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0
                  ),
                  child: Text(
                    'Your library',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((e) => ListTile(
                  dense: true,
                  title: Text(e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                ).toList(),
              ],
            ),
            SizedBox(height: 24.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0
                  ),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) => ListTile(
                  dense: true,
                  title: Text(e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                ).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
