function update --description "Shorthand to update all parts of my system"
    pikaur -Syu
    fisher update
    yadm up
    yadm diff master@\{1\} --name-only | grep "files.gpg" >/dev/null
    if [ $status = 0 ]
        yadm decrypt
    end
end
