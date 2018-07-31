function get-props
    ssh $argv "sudo tar czf - --directory=/etc/sindbad/local ." | tar xzf -
end
