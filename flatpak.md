### To make flatpak app visible to dash in Ubuntu
```
sudo cp sudo cp /var/lib/flatpak/app/<app_name>/current/active/export/share/applications/<app_name>.desktop /usr/share/applications
```
`<app_name>` can be accessed by using `Tab` key for autocompletion.

### List installed flatpaks
```
flatpak list
```
### See flatpak version
```
flatpak --version
```
### Search in flatpak repository
Say we are searching for vlc
```
flatpak remote-ls | grep -i vlc
```
