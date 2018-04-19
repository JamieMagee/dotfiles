function update --description "Shorthand to update all parts of my system"
    pikaur -Syu
    fisher update
    yadm up
end
