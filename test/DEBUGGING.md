# Debugging

## Testing deep links

**Android**
``` bash
adb shell am start -a android.intent.action.VIEW \
  -d "inmo://inmo-latam.com/deeplink/email-verification?code=123456&email=marlonsubuyu.2012@gmail.com"
```

**iOS**
``` bash
# For Simulator

xcrun simctl openurl booted "inmo://inmo-latam.com/deeplink/email-verification?code=123456&email=marlonsubuyu.2012@gmail.com"

# For real device through Safari
inmo://inmo-latam.com/deeplink/email-verification?code=123456&email=marlonsubuyu.2012@gmail.com
```

## Testing app links

**Android**
``` bash
adb shell am start -a android.intent.action.VIEW \
  -d "https://www.inmo-latam.com/deeplink/email-verification?code=123456&email=marlonsubuyu.2012@gmail.com"
```