c = get_config()

c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.confirm_exit = False

c.TerminalInteractiveShell.prompts_class = "IPython.terminal.prompts.ClassicPrompts"
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False
