# Asfand Qazi home directory backup

Where I back up various files to let me work from anywhere and any machine (config files, documentation, tools, etc.)

Best used with a .git directory not in the home directory itself, using command (e.g.):

    git --git-dir="${HOME}/.homebak/.git" --work-tree="${HOME}"

The .gitignore file can be used to granularly control what gets checked in, as it ignores everything by default, unless files and directories are explicitly allowed in.

This script checks changes in every hour:

    bin/homebak-all
