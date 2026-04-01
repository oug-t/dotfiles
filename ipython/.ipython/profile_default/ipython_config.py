c = get_config()

c.InteractiveShell.colors = 'NoColor'

c.TerminalInteractiveShell.highlighting_style = "legacy"
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.prompts_class = "IPython.terminal.prompts.ClassicPrompts"
