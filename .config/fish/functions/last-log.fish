function last-log -d "Show the log for the last mse-build"
    set LOG_FILE (find /tmp/mse* -type f | sort -r | head -1)
    less +G $LOG_FILE
end