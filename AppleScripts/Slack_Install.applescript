tell application "System Events"
    -- Check if Slack is installed
    if not (exists application "Slack") then
        -- Download Slack DMG file
        try
            do shell script "curl -O https://downloads.slack-edge.com/mac_releases/Slack-4.0.0.dmg"
        on error
            display dialog "Failed to download Slack." buttons {"OK"} default button "OK"
            return
        end try

        -- Mount the DMG
        try
            do shell script "hdiutil attach Slack-4.0.0.dmg"
        on error
            display dialog "Failed to mount Slack DMG." buttons {"OK"} default button "OK"
            return
        end try

        -- Copy Slack to the Applications folder
        try
            do shell script "cp -r /Volumes/Slack/Slack.app /Applications/"
        on error
            display dialog "Failed to copy Slack to the Applications folder." buttons {"OK"} default button "OK"
            return
        end try

        -- Detach the DMG
        try
            do shell script "hdiutil detach /Volumes/Slack"
        on error
            display dialog "Failed to unmount Slack DMG." buttons {"OK"} default button "OK"
            return
        end try

        -- Display success message
        display dialog "Slack has been installed successfully." buttons {"OK"} default button "OK"
    else
        display dialog "Slack is already installed." buttons {"OK"} default button "OK"
    end if
end tell
