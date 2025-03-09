#!/bin/bash
packages=(
  "com.miui.analytics"
  "com.miui.audiomonitor"
  "com.miui.bugreport"
  "com.miui.videoplayer"
  "com.miui.player"
  "com.miui.cleaner"
  "com.miui.micloudsync"
  "com.miui.cloudbackup"
  "com.miui.yellowpage"
  "com.miui.daemon"
  "com.miui.miservice"
  "com.miui.backup"
  "com.miui.msa.global"
  "com.xiaomi.mipicks"
  "com.xiaomi.aicr"
  "com.xiaomi.payment"
  "com.xiaomi.discover"
  "org.mipay.android.manager"
  "com.google.android.apps.maps"
  "com.google.android.apps.restore"
  "com.google.android.apps.subscriptions.red"
  "com.google.android.apps.safetyhub"
  "com.google.android.as"
  "com.google.android.youtube"
  "com.google.android.tts"
  "com.google.android.mainlne.telemetry"
  "com.google.android.feedback"
  "com.google.android.calendar"
  "com.google.android.configupdater"
  "com.google.android.setupwizard"
  "com.google.android.setupwizard.searchselector.SearchEngineSelectorApplication"
  "com.google.android.partnersetup"
  "com.google.android.gm"
  "com.google.android.printservice.recommendation"
  "com.google.android.marvin.talkback"
  "com.google.android.googlequicksearchbox"
  "com.android.hotwordenrollment.xgoogle"
  "com.android.hotwordenrollment.okgoogle"
  "com.google.android.providers.calendar"
  "com.android.chrome"
  "com.android.stk"
  "com.android.traceur"
  "com.android.bookmarkprovider"
  "com.facebook.system"
  "com.facebook.appmanager"
  "com.facebook.services"
  "com.silead.factorytest"
  "de.telekom.tsc"
  "com.quicinc.voice.activation"
  "com.boundax.koreapreloadappinstaller"
)

echo "Awaiting device connection..."
adb -d devices
echo -n "Please enter the device ID: "
read -r device
if ! adb -s "${device}" get-state &>/dev/null; then
  echo "Failed to connect to device ${device}. Please check the connection."
  exit 0
fi

uninstall() {
  device="${1}"
  package="${2}"
  read -a users <<< "$(adb -s "${device}" shell pm list users | awk -F '[{}:]' '/UserInfo/{print $2}')"
  for user in "${users[@]}"; do
	if adb -s "${device}" shell pm list packages --user "${user}" | grep -q "${package}"; then
		echo "Cleaning ${package} data for user ${user}..."
		adb -s "${device}" shell pm clear --user "${user}" "${package}"
		echo "Uninstalling ${package} for user ${user}..."
		adb -s "${device}" shell pm uninstall -k --user "${user}" "${package}"
	fi
  done
}

for package in "${packages[@]}"; do
  uninstall "${device}" "${package}"
done

adb -s "${device}" shell reboot
