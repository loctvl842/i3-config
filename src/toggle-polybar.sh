visible=$(grep -w visible ~/.config/i3/config | grep -oP 'visible \K\w+')
theme=$(grep -w theme ~/.config/i3/config | grep -oP 'theme \K\w+')
echo $theme

if [ $visible == "true" ]
then
  killall -q polybar
  sed -i -e '0,/$visible .*/s//$visible false/' ~/.config/i3/config
else
  ~/.config/polybar/$theme/launch.sh
  sed -i -e '0,/$visible .*/s//$visible true/' ~/.config/i3/config
fi

# killall -q polybar
i3-msg reload
