import sublime, sublime_plugin
from time import localtime, strftime

class InsertDatetimeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sel = self.view.sel();
        for s in sel:
            self.view.replace(edit, s, strftime("%Y-%m-%d", localtime()))