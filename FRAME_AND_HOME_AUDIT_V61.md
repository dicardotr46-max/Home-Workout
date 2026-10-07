# FRAME_AND_HOME_AUDIT_V61

## Scope
V60 source was used as the baseline. The visual QA focused on exercise frames, home equipment, and the per-exercise YouTube link.

## Home resistance-band fixes
Replaced frame sets for:
- d1_e1 Band pull-down: door-top anchor, no gym cable tower
- d1_e6 Face pull: door-top anchor, no gym cable tower
- d1_e10 Triceps pressdown: door-top anchor, no gym cable tower
- d1_e13 Pallof press: door-side anchor, no gym cable tower
- d1_e7 Band pull-apart: handheld resistance band, no anchor/device

Updated equipment labels in the exercise data for d1_e7 and d1_e2 to make the home setup explicit.

## Additional frame refresh
Replaced/reframed:
- d1_e2 Scapular pull
- d1_e8 Side-lying external rotation
- d1_e14 Wrist gripper

All changed frame images are 1200x400 and kept local in app assets.

## YouTube link
The per-exercise link remains the exact YouTube ID already stored in WORKOUT_DATA. The text link row was replaced by a centered, crisp vector YouTube button (red rounded rectangle + white play triangle). Android MainActivity already routes http/https links through ACTION_VIEW, so tapping the button opens the matching YouTube URL in the device's browser/YouTube app.

## Integrity checks
- ZIP test: passed
- APK v1 JAR signature verification: passed
- APK v2 signature: verified independently
- v2 RSA signature: verified
- v2 content digest: matched
- certificate public key: matched
- resources.arsc: stored + 4-byte aligned
- AndroidManifest.xml: stored + 4-byte aligned
- classes.dex: stored + 4-byte aligned
