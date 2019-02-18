function rdp -d "Connect to my VM"
  set -lx user (lpass show "microsoft.com" --field=user)
  set -lx password (lpass show "microsoft.com" --password)
  set -lx domain (lpass show "microsoft.com" --field=domain)
  set -lx host (lpass show "microsoft.com" --field=hostname)

  set -lx ip (ip addr show | grep 'inet ' | awk '{print $2}' | cut -f1 -d'/')

  if ! string match -q -r -- ".* 10(\.\d{1,3}){3} .*" $ip
    set gateway /g:dublints.microsoft.com
  end

  echo $gateway

  xfreerdp                        \
    /aero                         \
    /auto-reconnect               \
    /auto-reconnect-max-retries:3 \
    /bpp:32                       \
    /cert-ignore                  \
    /clipboard                    \
    /f                            \
    /fonts                        \
    /gdi:sw                       \
    /gfx                          \
    /gfx-progressive              \
    +home-drive                   \
    /menu-anims                   \
    /microphone                   \
    /smart-sizing                 \
    /sound                        \
    /window-drag                  \
    /u:"$user"                    \
    /d:"$domain"                  \
    /v:"$host"                    \
    /p:"$password"                \
    $gateway
end
