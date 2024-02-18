import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/core/constants/assets_constants.dart';
import 'package:mehyay/core/theme/palette.dart';
import 'package:mehyay/emergency_record/controllers/emergency_record_state_controller.dart';
import 'package:mehyay/emergency_record/repositories/speech_to_text_repository.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    ref.read(emergencyRecordStateControllerProvider).init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإعلان عن حالة طوارئ"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider).signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Palette.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Palette.mInsets),
        child: Column(
          children: [
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: GestureDetector(
                    onTap: () => ref
                        .read(emergencyRecordStateControllerProvider)
                        .toggleAnimation(),
                    child: LottieBuilder.asset(
                      animate: false,
                      fit: BoxFit.contain,
                      AssetsConstants.micPulse,
                      controller: ref
                          .watch(emergencyRecordStateControllerProvider)
                          .controller,
                      onLoaded: (composition) {
                        ref
                            .watch(emergencyRecordStateControllerProvider)
                            .controller
                            .duration = composition.duration;
                      },
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.mic,
                    size: 70,
                    color: Palette.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("إنشاء تقرير طوارئ"),
            )
          ],
        ),
      ),
    );
  }
}
