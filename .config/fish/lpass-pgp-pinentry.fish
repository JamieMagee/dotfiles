#!/bin/fish

echo OK

while read -la cmd
    switch "$cmd"
        case GETPIN
            echo "D "(lpass show PGP/keybase --field="Passphrase")
            echo OK
        case BYE
            echo OK
        case '*'
            echo OK
    end
end
