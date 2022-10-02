# Daily NASA Wallpaper
Every day, NASA posts a beautiful astronomy picture on its [Astronomy Picture of the Day website](https://apod.nasa.gov/apod/astropix.html), I love these pictures and I always use these pictures as wallpapers, so I think maybe I can write some shell script to automatically update my wallpaper with the picture of the day. The script, as it turns out, is surprisingly straightforward.

## Usage
You can add this script to your Startup Applications Preferences and it will automatically update your wallpaper every day.

1. download the script localy
2. open crontab using `crontab -e ` command
3. enter the following to the end of the file:
    ```
    0 * * * * /<PATH_TO_SCRIPT>/daily-nasa.sh
    ```
    this will run the script every hour to check for new image.

## Ubuntu 22.04
If you are using Ubuntu 22.04 and using dark mode this script wont work for you, to make it work you need to add the foloowing line to the end of the script
```
   # set dark-mode as well to support dark mode screen in ubuntu 22.04
   gsettings set org.gnome.desktop.background picture-uri-dark "file://${SAVE_LOCATION}/${IMG}"
```