# WorkOutHome V65 — Build & Toolchain

- Gradle Wrapper: 8.9
- Android Gradle Plugin: 8.7.3
- JDK in CI: 17
- compileSdk / targetSdk: 35
- CI uses `gradle/actions/setup-gradle@v4` to provision Gradle 8.9 and invokes the provisioned `gradle` binary directly, avoiding a second network download by the Wrapper.
- CI uses `android-actions/setup-android@v3`.
- APK is uploaded as a workflow artifact after `:app:assembleDebug`.
- Gradle 8.9 binary SHA-256: `d725d707bfabd4dfdc958c624003b3c80accc03f7037b5122c4b1d0ef15cecab`.

This sandbox has JDK 21 but no Gradle distribution or Android SDK, and outbound binary downloads are blocked, so a local APK build cannot be honestly claimed here. The CI workflow is designed to perform the real build on a GitHub runner.
