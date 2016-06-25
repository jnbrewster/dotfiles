EXTENSIONPATH="$HOME/Downloads"
GRABEXTENSION="wget --unlink -P $EXTENSIONPATH"

rm $EXTENSIONPATH/*.safariextz

$GRABEXTENSION "https://cache.agilebits.com/dist/1P/ext/1Password-4.2.5.safariextz"
$GRABEXTENSION "https://safari-extensions.apple.com/extensions/com.instapaper.extension-CAM49M58WK/instapaper.safariextz"
