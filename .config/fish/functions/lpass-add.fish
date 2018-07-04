function lpass-add
    if count $argv > /dev/null
        set -lx exists (lpass ls SSH/$argv)
        if [ $exists ]
            set -lx tmp (mktemp /tmp/pass.XXX)
            echo -e "#!/bin/fish\nlpass show SSH/$argv --field=\"Passphrase\"\n" >> $tmp
            chmod +x $tmp
            set -lx SSH_ASKPASS $tmp
            echo | ssh-add (lpass show SSH/$argv --field="Private Key" | psub)
            rm $tmp
        else
            echo "Could not find SSH key with name $argv"
        end
    else
        echo "SSH key name required"
    end
end
