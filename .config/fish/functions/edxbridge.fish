function edxbridge --description 'Setup SSH bridge to EDX nodes'
    if [ $argv = 'odd' ]
        set ssh_tunnel_cmd 'ssh -NfL 9500:dev1-eu1-1-edxagg1-1:9300 -L 9200:dev1-eu1-1-edxagg1-1:9200 -L 11070:dev1-eu1-1-matcher1-1:9300 jump-dse1'
    else if [ $argv = 'even' ]
        set ssh_tunnel_cmd 'ssh -NfL 9500:dev1-eu2-2-edxagg1-1:9300 -L 9200:dev1-eu2-2-edxagg1-1:9200 -L 11070:dev1-eu2-2-edxagg1-1:9300 jump-dse1'
    else
        echo 'invalid input. Usage: edxbridge odd|even'
    end
    echo "Setting up EDX bridge with command: $ssh_tunnel_cmd"
    eval $ssh_tunnel_cmd
    echo "SSH tunnel PID:" (pgrep "ssh\$")
    echo 'Local bridge endpoint: http://localhost:9200/_plugin/head'
end
