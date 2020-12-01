function rdp -d "Connect to my VM"
  set -lx user (lpass show "microsoft.com" --field=user)
  set -lx password (lpass show "microsoft.com" --password)
  set -lx domain (lpass show "microsoft.com" --field=domain)
  
  test -n "$argv"; and set -lx host "$argv".redmond.corp.microsoft.com.; or set -lx host (lpass show "microsoft.com" --field=rdp1);

  echo "$host"

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
    /log-level:WARN               \
    /menu-anims                   \
    /microphone                   \
#    /scale:100                    \
#    /scale-desktop:150            \
    /smart-sizing                 \
    /sound                        \
    +unmap-buttons                \
    /window-drag                  \
    /u:"$user"                    \
    /d:"$domain"                  \
    /v:"$host"                    \
    /p:"$password"
end
