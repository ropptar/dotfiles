DISTRO=`hostnamectl | grep --color=never System`
if [[ "$DISTRO" =~ "NixOS" ]]; then
    echo ""
elif [[ "$DISTRO" =~ "Arch" ]]; then
    echo ""
else 
    echo ""
fi
