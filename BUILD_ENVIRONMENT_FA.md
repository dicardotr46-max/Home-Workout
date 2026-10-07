# وضعیت Build — WorkOutHome V64

## نتیجه بررسی این محیط
- Java 21 موجود است.
- Gradle به‌صورت system-wide نصب نیست.
- Gradle Wrapper پروژه روی **Gradle 8.9** تنظیم است.
- دسترسی خروجی شبکه از container به `services.gradle.org` و سایر mirrorها مسدود است؛ تست DNS/اتصال انجام شد.
- برای Gradle 8.9 یک مسیر fallback به Huawei Cloud mirror در `tools/prepare-gradle-8.9.sh` اضافه شده است.
- برای build کاملاً آفلاین، فایل `tools/gradle-8.9-bin.zip` پشتیبانی می‌شود.

## منابع تأییدشده
توزیع رسمی `gradle-8.9-bin.zip` در سرور رسمی Gradle موجود است.
Mirror هواوی نیز فایل `gradle-8.9-bin.zip` را ارائه می‌کند.

## نکته مهم
حتی با در دسترس شدن Gradle، build اندروید به Android SDK و dependencyهای Android Gradle Plugin نیاز دارد. در محیط فعلی، SDK Android و cache کامل dependencyهای Maven نیز موجود نیست؛ بنابراین صرفاً نصب Gradle به‌تنهایی تضمین‌کننده build نهایی APK در این sandbox نیست.
