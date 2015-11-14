Alwinner A23 (GT90h) CyanogenMod 12.1 device tree
----------------------------------------------------
Hardware	: sun8i

To initialize your local repository using the CyanogenMod trees, use a command like this:

    $ repo init -u git://github.com/CyanogenMod/android.git -b cm-12.1

Then to sync up:

    $ repo sync

Build:

	$ . build/envsetup.sh

	$ brunch cm_polaris_p1-eng 2>&1 | tee build.log


* Working
  * UI
  * GPU
  * Sensors
  * SD-card
  * OTG

* Not Working
  * Touch
  * WiFi
  * bt
  * Camera
  * Audio


