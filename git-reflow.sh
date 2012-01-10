##!/bin/sh
#
# $ git reflow start nh-feature-branch
#     Start a feature:
#     Checks out new branch

# $ git reflow edit
#     Opens $EDITOR to let you configure your workflow (stored per repo, maybe in .git/description (no one really uses that file anyway)?).
#     Stuff to configure:
#       - tests are enabled and the command to run them
#       - deploys are enabled and the command to run them
#       - github integration
#       - remote we want to work against (default: origin)
#       - process tweaks? Allow callbacks before each step?
#
#     flags: 
#       --default    Edit the default reflow to configure global settings?
#
# $ git reflow edit-commit-template
#     Opens $EDITOR to let you configure the stub for the commit message
#
# $ git reflow deliver master
#     All of the following are run linearly, and we’ll dump on any failure:
#     Is the dest branch up-to-date with origin?
#     Are we merged up to the dest branch?
#     Run the test suite (if enabled)
#     Has this branch been pushed to origin?
#     Do we have a pull request?
#     IF not, create it and bail with URL
#     If so, do we have lgtm?
#     checkout destination branch
#     Merge squashed
#     Prep commit message (injecting [Closes #<pull_request_num>])
#     perform the commit
#     delete the remote branch
#     delete the local branch
#     deploy (if enabled)

usage() {
  echo "usage: git reflow <subcommand>"
  echo
  echo "Available subcommands are:"
  echo "   start                Initialize a new git repo with support for the branching model."
  echo "   edit                 Manage your feature branches."
  echo "   edit-commit-template Manage your  release branches."
  echo "   deliver              Manage your hotfix branches."
}

main() {

  $GITREFLOW_DIR = ''

  if [ $# -lt 1 ]; then
    usage
    exit 1
  fi

  git config --global alias.reflow '!./git-reflow'
  git reflow "$@"
}

main "$@"