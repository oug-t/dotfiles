require('competitest').setup({
    received_problems_path = function(task, file_extension)
        local home = os.getenv("HOME")
        
        local contest_id = "unknown_contest"
        local problem_id = task.name -- default to full name if all else fails

        if task.url then
            local c, p = task.url:match("contest/(%d+)/problem/([%w%p]+)")
            if c and p then
                contest_id = c
                problem_id = p
            else
                c, p = task.url:match("problem/(%d+)/([%w%p]+)")
                if c and p then
                    contest_id = c
                    problem_id = p
                end
            end
        end

        if problem_id == task.name then
            local p_letter = task.name:match("^(%w+)%.") -- Matches "A."
            if p_letter then problem_id = p_letter end
        end

        return string.format("%s/code/codeforces/%s/%s.%s", home, contest_id, problem_id, file_extension)
    end,

    received_contest_problems_path = function(task, file_extension)
        local home = os.getenv("HOME")
        local contest_id = "unknown_contest"
        local problem_id = task.name
        
        if task.url then
            local c, p = task.url:match("contest/(%d+)/problem/([%w%p]+)")
            if c and p then contest_id, problem_id = c, p end
            local c2, p2 = task.url:match("problem/(%d+)/([%w%p]+)")
            if c2 and p2 then contest_id, problem_id = c2, p2 end
        end
        if problem_id == task.name then
            local p = task.name:match("^(%w+)%.")
            if p then problem_id = p end
        end
        
        return string.format("%s/code/codeforces/%s/%s.%s", home, contest_id, problem_id, file_extension)
    end,

    template_file = "$(HOME)/code/codeforces/template.rb",
    received_files_extension = "rb",
    runner_ui = { interface = "popup" },
})
