# V62 — Professional frame system progress

- Frame stage changed from 2:1 to 16:9 layout.
- 16:9 images use edge-to-edge cover; legacy ratios temporarily use contain so old frames are not cropped while the library is being replaced.
- Frame images are preloaded when an exercise stage is initialized/running to reduce visible decode/network stalls during frame changes.
- Image elements declare 1920×1080 intrinsic dimensions to reduce layout shift.
- `d1_e1` five frame assets were replaced with 1920×1080 versions in the existing asset folders and keep the exact existing filenames.
- JavaScript syntax validation passed with Node.js.
- Android Gradle build could not be executed in this offline environment because the Gradle 8.9 distribution is not cached locally and `services.gradle.org` was unreachable.
