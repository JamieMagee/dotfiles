function __change_git_user -v PWD -d "Change git user depending on directory"
    status --is-command-substitution; and return
    if git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null
        switch $PWD
        case "*work*"
            git work
        case "*"
            git personal
        end
    end
end