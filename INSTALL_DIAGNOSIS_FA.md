# تشخیص و اصلاح خطای App not installed

## ریشه مشکل نسخه قبلی

در `app/build.gradle`، applicationId مورد انتظار `com.browseruse.workout.v147` بود، اما APK واقعی موجود در این پروژه در `AndroidManifest.xml` با package `com.browseruse.workout.v145` ساخته شده بود. بنابراین APK و سورس با هم منطبق نبودند.

نسخه قبلی فریم‌ها همچنین با یک کلید تستی متفاوت از APK اصلی امضا شده بود. در نتیجه اگر یک نسخه هم‌package با گواهی دیگری روی گوشی وجود داشته باشد، Android آن را به‌عنوان update با امضای ناسازگار رد می‌کند و می‌تواند پیام عمومی `App not installed` نشان دهد.

## خروجی‌ها

- `WorkoutHome_14_9_FIXED_v147.apk`: package صحیح `com.browseruse.workout.v147` و شامل فریم‌های جدید ترامپولین.
- `WorkoutHome_14_9_FIXED_v148_PARALLEL.apk`: package `com.browseruse.workout.v148` برای تست کنار نسخه‌های قبلی بدون تداخل package/signature.

### نکته نصب

برای تست ساده و مستقل، از نسخه v148 استفاده کنید؛ این نسخه برای نصب موازی است.
اگر قرار است v147 جایگزین نسخه‌ای با همان package شود، باید APK قبلی حذف شود یا keystore اصلی پروژه برای امضای نسخه جدید در اختیار باشد. private key از certificate داخل APK قابل استخراج نیست.
