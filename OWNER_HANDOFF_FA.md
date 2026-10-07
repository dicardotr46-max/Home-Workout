# پرونده تحویل مالک نرم‌افزار

## وضعیت نسخه

- نام پروژه: WorkoutHome
- نام نمایشی: تمرین خانگی ۱۴.۹
- package/applicationId: `com.browseruse.workout.v147`
- versionName: `14.9`
- versionCode: `3`
- compileSdk و targetSdk: `35`
- زبان رابط: فارسی و راست‌به‌چپ
- نوع اجرا: Android WebView با فایل‌های کاملاً محلی
- آخرین اصلاح: اتصال frame player برای گابلت اسکوات، لانج معکوس، ددلیفت رومانیایی، پل باسن، برد-داگ و کرانچ با مدیسن‌بال

## فایل‌های اصلی

- `app/src/main/assets/index.html`: تمام رابط کاربری، برنامه تمرین، منطق تایمر، انیمیشن و frame player.
- `app/src/main/java/com/browseruse/workout/MainActivity.java`: پوسته Android، WebView، انتخاب فایل و ذخیره پشتیبان.
- `app/src/main/AndroidManifest.xml`: تعریف برنامه و activity اصلی.
- `app/src/main/res/values/strings.xml`: نام نمایشی برنامه.
- `app/build.gradle`: شناسه، نسخه و تنظیمات Android.
- `build.gradle`: نسخه Android Gradle Plugin.
- `settings.gradle`: نام پروژه و ماژول app.

## حرکات فعال

این ۷ حرکت در برنامه فعال هستند:

1. `d2_e1` گابلت اسکوات
2. `d2_e2` لانج معکوس
3. `d2_e3` ددلیفت رومانیایی
4. `d2_e4` پل باسن
5. `d2_e6` برد-داگ
6. `d2_e7` کرانچ با توپ جلوی سینه
7. `d2_e8` کاندیشنینگ ریتمیک روی ترامپولین

حرکت `d2_e_opt` ساق پا عمداً غیرفعال است و نباید دوباره فعال شود مگر با تصمیم مالک.

## تصاویر و انیمیشن

حرکت‌های زیر از پنج تصویر PNG محلی استفاده می‌کنند:

- `app/src/main/assets/goblet/`
- `app/src/main/assets/reverse_lunge/`
- `app/src/main/assets/romanian_deadlift/`
- `app/src/main/assets/glute_bridge/`
- `app/src/main/assets/bird_dog/`
- `app/src/main/assets/medicine_crunch/`

فایل‌های پردازش‌شده و قابل استفاده مجدد در پوشه هم‌نام داخل `outputs/` قرار دارند.

حرکت `d2_e8` در حال حاضر با رندر برداری داخلی اجرا می‌شود و تصویر خارجی ندارد. برای تبدیل آن به پنج تصویر PNG باید در `index.html` این بخش‌ها اضافه یا تغییر کنند:

- یک آرایه مانند `MEDICINE_CRUNCH_FRAME_SOURCES`
- تابع `create...FrameStage`
- اتصال در `createInitialStageSVG`
- اضافه‌کردن `frameImg` در `STAGE_NODES`
- تابع `update...FrameScene`
- branch مربوط به حرکت در `updateKinematicScene`

## منطق frame player

تابع `updateFrameScene` بر اساس زمان حرکت، پنج فریم را انتخاب می‌کند. مرزهای فعلی انتخاب فریم عبارت‌اند از:

- کمتر از ۱۲٪: فریم ۱
- ۱۲ تا ۳۲٪: فریم ۲
- ۳۲ تا ۵۸٪: فریم ۳
- ۵۸ تا ۸۰٪: فریم ۴
- بیشتر از ۸۰٪: فریم ۵

کنترل‌های مکث، سرعت، تایمر، ثبت ست و ثبت علامت نباید هنگام تغییر تصاویر حذف یا بازنویسی شوند.

## ذخیره‌سازی و Android bridge

- کلید localStorage اصلی: `WORKOUT_APP_REFINED_V16_STABLE`
- فایل پشتیبان از JavaScript با `AndroidBridge.saveTextFile(...)` در پوشه Downloads ذخیره می‌شود.
- فایل‌های تمرین با `file:///android_asset/index.html` بارگذاری می‌شوند.
- برای اجرای آفلاین، تصاویر و HTML باید داخل assets بمانند.

## ساخت APK

این پروژه Gradle wrapper ندارد. برای ساخت، باید Android SDK شامل platform 35 و build-tools 35.0.0 و Gradle سازگار با Android Gradle Plugin 8.7.3 نصب باشد.

از پوشه `android-workout`:

```bash
gradle assembleDebug
```

خروجی معمول:

```text
app/build/outputs/apk/debug/app-debug.apk
```

برای انتشار، باید مالک یک keystore جدید یا keystore قبلی خود را داشته باشد. کلید امضای APK داخل این بسته قرار داده نشده است. APK امضاشده با کلید ناشناخته را نمی‌توان با همان امضا به‌روزرسانی کرد.

## وضعیت APK موجود

فایل `outputs/WorkoutHome_14_9_LATEST.apk` از پوسته APK موجود و assetهای آخرین سورس بسته‌بندی شده است. برای build استاندارد Gradle، Java، SDK و AAPT2 سازگار با معماری دستگاه لازم است. سورس داخل بسته، مرجع اصلی و به‌روز است.

## راهنمای درخواست از هوش مصنوعی بعدی

این متن را همراه ZIP به هوش مصنوعی بعدی بده:

> این یک پروژه Android WebView آفلاین فارسی و راست‌به‌چپ است. package را به `com.browseruse.workout.v147` و targetSdk را به 35 محدود نگه دار. منطق تایمر، localStorage، کنترل مکث/سرعت، ثبت ست و AndroidBridge را تغییر نده مگر صریحاً درخواست شود. تمام UI و منطق اصلی در `app/src/main/assets/index.html` است. قبل از هر تغییر، ساختار فعلی را بخوان. برای تغییر تصویر یک حرکت، پنج فریم با نام‌گذاری موجود بساز، در پوشه asset همان حرکت قرار بده، source array و branchهای stage/update را به‌روز کن و سپس چرخه فریم را تست کن. حرکت ساق پا عمداً غیرفعال است. هیچ کلید API، keystore یا رمز عبوری در پروژه قرار نده.

## مواردی که نباید حذف شوند

- `app/src/main/assets/index.html`
- تمام پوشه‌های فریم داخل `app/src/main/assets/`
- `MainActivity.java`
- `AndroidManifest.xml`
- `app/build.gradle`, `build.gradle`, `settings.gradle`
- `proguard-rules.pro`
