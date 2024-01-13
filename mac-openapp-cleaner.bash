#!/bin/bash

#automated header , aelamrani, 05/11/2023

# List of stubborn applications to be force-closed
declare -a stubborn_apps=("RoyalTSX" "steam_osx" "Electron")

# Display list of stubborn applications
echo "The following stubborn applications will be force-closed if running, CAREFUL WITH ROYALTSX, Save it now !"
for app in "${stubborn_apps[@]}"; do
    echo "- $app"
done
echo ""

# Function to check if an app is in the stubborn app list
is_stubborn_app() {
    for sa_app in "${stubborn_apps[@]}"; do
        if [[ "$sa_app" == "$1" ]]; then
            return 0 # True, it is a stubborn app
        fi
    done
    return 1 # False, it is not a stubborn app
}

# List all open applications
open_apps=$(osascript -e 'tell application "System Events" to get name of every process where background only is false')

# Display each application on a new line
echo "The following applications are currently open:"
IFS=',' read -r -a app_array <<< "$open_apps"
for app in "${app_array[@]}"; do
    trimmed_app=$(echo $app | xargs) # Trim leading/trailing whitespace
    echo "$trimmed_app"
done

# Ask for confirmation before closing each application
for app in "${app_array[@]}"; do
    trimmed_app=$(echo $app | xargs) # Trim leading/trailing whitespace
    echo -n "Press Enter to close \"$trimmed_app\", or type 'n' to skip: "
    read choice

    if [ -z "$choice" ]; then # if choice is empty, user pressed Enter
        if is_stubborn_app "$trimmed_app"; then
            echo "Force closing $trimmed_app..."
            if [[ "$trimmed_app" == "steam_osx" ]]; then
                pgrep -l "$trimmed_app" | awk '{print $1}' | xargs kill -9
            else
                killall "$trimmed_app" 2>/dev/null
            fi
        else
            echo "Closing $trimmed_app..."
            osascript -e "tell application \"$trimmed_app\" to quit"
        fi
    elif [[ $choice == "n" || $choice == "N" ]]; then
        echo "Skipping $trimmed_app..."
    else
        echo "Invalid response. Skipping $trimmed_app..."
    fi
done

echo "Operation complete."
