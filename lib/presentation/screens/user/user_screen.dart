import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:user_management/application/user/user_event.dart';
import 'package:user_management/domain/user/user_model.dart';
import 'package:user_management/presentation/style/app_colors.dart';
import 'package:user_management/presentation/style/app_layout.dart';
import 'package:user_management/providers/user/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserBody(),
    );
  }
}

class UserBody extends ConsumerStatefulWidget {
  const UserBody({super.key});

  @override
  ConsumerState<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends ConsumerState<UserBody> {
  ScrollController? scrollController;
  _scrollListener() {
    if (scrollController!.offset >=
            scrollController!.position.maxScrollExtent &&
        !scrollController!.position.outOfRange) {
        /// Fetch new data news
        final userRef = ref.watch(userProvider);
        if (userRef.reachedMax == false) {
          ref.read(userProvider.notifier).mapEventsToState(const LoadMore());
        }
    }
  }
  
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController?.addListener(_scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    final userRef = ref.watch(userProvider);
    if (userRef.isLoading && userRef.items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (userRef.items.isEmpty) {
      return Center(
        child: Text(
          "User not founds",
          style: AppLayout.styleTitle.copyWith(
            fontSize: 40.sp,
            color: AppColors.blackColor,
          )
        ),
      );
    }

    bool loadNewPage = userRef.isLoading && userRef.items.isNotEmpty;
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(userProvider),
      child: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.zero,
            itemCount: userRef.items.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final user = userRef.items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _userItem(user: user),
                  loadNewPage && index == userRef.items.length - 1 
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _userItem({required UserModel user}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 1.5.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        child: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.avatar
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: AppLayout.styleTitle.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  user.email,
                  style: AppLayout.styleSubtitle.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}