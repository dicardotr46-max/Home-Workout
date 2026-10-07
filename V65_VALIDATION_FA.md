# اعتبارسنجی V65

## انجام‌شده در این محیط
- JDK 21 موجود و قابل اجرا است.
- Node.js موجود است و JavaScript استخراج‌شده از `index.html` با `node --check` بدون خطای syntax بررسی شد.
- تعداد 235 فایل PNG داخل assets بررسی شد و همه دقیقاً `1920×1080` هستند.
- فایل Wrapper موجود است و روی Gradle `8.9` تنظیم شده است.
- SHA-256 توزیع Gradle 8.9 در Wrapper ثبت شده است.
- اجرای `./gradlew --version` عمداً برای تشخیص واقعی مشکل انجام شد؛ خطا `UnknownHostException: services.gradle.org` بود.

## مانع قطعی
این sandbox توزیع Gradle و Android SDK لازم برای build را ندارد و اتصال خروجی شبکه برای دریافت آن‌ها مسدود است. بنابراین APK محلی در این محیط قابل ادعای build نیست.

## مسیر build نهایی آماده
Workflow در `.github/workflows/build-apk.yml` روی GitHub Actions ساخته شده است:
1. JDK 17
2. Android SDK + platform 35 + build-tools 35.0.0
3. Gradle 8.9
4. `gradle :app:assembleDebug`
5. آپلود APK به‌عنوان Artifact

این مسیر از Wrapper در مرحله CI استفاده نمی‌کند تا Gradle 8.9 دوباره دانلود نشود؛ خود GitHub Action آن را provision می‌کند.
