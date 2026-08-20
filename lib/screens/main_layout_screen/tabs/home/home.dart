// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/constants/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:evently/constants/app_styles.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/event_catogry.dart';
import 'package:evently/providers/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: CustomFab(),
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: const Icon(Icons.wb_sunny_outlined),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('EN', style: TextStyle(color: Colors.white)),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text('Welcome Back ✨', style: AppStyles.welcomeBack(context)),
            Text(
              "${currentUser!.displayName}",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.only(right: 12),
          padding: EdgeInsets.only(left: 16),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicator: const BoxDecoration(),
          splashBorderRadius: BorderRadius.circular(16),
          tabs: List.generate(categories.length, (index) {
            return AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                final isSelected = _tabController.index == index;
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
                        ? null
                        : Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        categories[index].icon,
                        size: 24,
                        color: isSelected
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        categories[index].label,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final category in categories)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: EventListView(events: Event.events),
            ),
        ],
        //  ,
      ),
    );
  }
}

class CustomFab extends StatelessWidget {
  const CustomFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: CircleBorder(),
      child: Icon(Icons.add),
    );
  }
}

class EventListView extends StatelessWidget {
  final List<Event> events;
  const EventListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return EventItem(event: events[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
      itemCount: events.length,
    );
  }
}

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .22,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(event.imgPath), fit: .cover),
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          DateBadge(dateTime: event.dateTime),
          Spacer(),
          TitleBar(title: event.title, isFavorite: event.isFavorite),
        ],
      ),
    );
  }
}

class TitleBar extends StatefulWidget {
  final String title;
  bool isFavorite;
  TitleBar({super.key, required this.title, required this.isFavorite});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w500,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            // Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.isFavorite = !widget.isFavorite;
                });
              },
              icon: widget.isFavorite
                  ? ImageIcon(
                      AssetImage(AppImages.heartSelected),
                      color: Theme.of(context).primaryColor,
                    )
                  : ImageIcon(
                      AssetImage(AppImages.heart),
                      color: Theme.of(context).primaryColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateBadge extends StatelessWidget {
  final DateTime dateTime;
  const DateBadge({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .182,
      margin: EdgeInsets.only(top: 8, left: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              dateTime.day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: 4),
            Text(
              DateFormat('MMM').format(dateTime),
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
