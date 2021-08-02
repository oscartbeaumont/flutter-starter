Expand-Archive -Path Runner.app.zip
Rename-Item Runner.app Payload
Compress-Archive -Path Payload -DestinationPath Payload.zip
Rename-Item -Path Payload.zip -NewName Payload.ipa
Remove-Item Payload -Recurse