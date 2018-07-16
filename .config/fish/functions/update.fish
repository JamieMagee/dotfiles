function update --description "Shorthand to update all parts of my system"
    yay -Syu
    fisher update
    yadm up
    yadm diff master@\{1.minute.ago\} --name-only | grep "files.gpg" >/dev/null
    if [ $status = 0 ]
        yadm decrypt
    end
end
