
# Navigation
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

# Utilities
function grep
    command grep --color=auto $argv
end

alias e="exit"
alias hx="helix"
alias yy="yazi"
# alias lf="yazi"
alias c="clear"
alias s="fastfetch"
alias zshrc="nvim ~/.zshrc"
alias fisha="nvim ~/.config/fish/aliases.fish"
alias "ms"="sudo mysql -u root -p"

# ------------ Tmux Start-------------------
alias "tmux"="tmux -u"
alias "tls"="tmux ls" #  NOTE: 列出会话
alias "tcs"="tmux new -s" #  NOTE: 新建会话
alias "td"="tmux detach" #  NOTE: 分离会话
alias "tsc"="tmux switch -t" #  NOTE: 切换会话
alias "tka"="tmux ls | cut -d: -f 1 | xargs -n1 tmux kill-session -t" #  NOTE: 杀死全部会话
alias "ts"="tmux source ~/.tmux.conf"
alias "at"="tmux at"
alias "sss"="smug start server" #  NOTE: smug session tool
alias "ssr"="smug start rye" #  NOTE: smug session tool
alias "ssa"="smug start accounting" #  NOTE: smug session tool
alias "sst"="smug start tax" #  NOTE: smug session tool
alias "ssp"="smug start python" #  NOTE: smug session tool
alias "ssae"="smug start example_accounting" #  NOTE: smug session tool
alias "ssf"="smug start financial" #  NOTE: smug session tool
alias "ssfe"="smug start example_financial" #  NOTE: smug session tool
# ------------ Tmux End--------------------

alias "hs"="sudo shutdown -h now"
alias "rs"="sudo shutdown -r now"
alias "hl"="hyprland"

# mv, rm, cp
alias mv 'command mv --interactive --verbose'
alias rm 'command rm --interactive --verbose'
alias cp 'command cp --interactive --verbose'

alias chmox='chmod +x'

alias where=which # sometimes i forget

# typos and abbreviations
abbr g git
abbr gi git
abbr gti git
abbr yearn yarn
abbr v vim
abbr bwre brew
abbr brwe brew

alias push="git push"
alias gc="git clone"

# `g co`, etc. subcommand expansion with `abbr`.
function subcommand_abbr
    set -l cmd "$argv[1]"
    set -l short "$argv[2]"
    set -l long "$argv[3]"

    # Check that these strings are safe, since we're going to eval. 👺
    if not string match --regex --quiet '^[a-z]*$' "$short"
        or not string match --regex --quiet '^[a-z- ]*$' "$long"
        echo "Scary unsupported alias or expansion $short $long"
        exit 1
    end

    set -l abbr_temp_fn_name (string join "_" "abbr" "$cmd" "$short")
    # Subcommand arg expanesion via commandline -tokenize + abbr --position anywhere
    # thx lgarron for inspiration: https://github.com/lgarron/dotfiles/blob/2bc3e0282b/dotfiles/fish/.config/fish/abbr.fish & https://github.com/lgarron/dotfiles/blob/main/dotfiles/fish/.config/fish/dev.fish
    # https://www.reddit.com/r/fishshell/comments/16s0bsi/leveraging_abbr_for_git_aliases/
    set -l abbr_temp_fn "function $abbr_temp_fn_name
    set --local tokens (commandline --tokenize)
    if test \$tokens[1] = \"$cmd\"
      echo $long
    else
      echo $short
    end;
  end;
  abbr --add $short --position anywhere --function $abbr_temp_fn_name"
    eval "$abbr_temp_fn"
end

subcommand_abbr git c "commit -am"
subcommand_abbr git tc "commit -am"
subcommand_abbr git cm "commit --no-all -m"
subcommand_abbr git co checkout
subcommand_abbr git c "commit -am"
subcommand_abbr git s status
subcommand_abbr git ts status
subcommand_abbr git amend "commit --amend --all --no-edit"
subcommand_abbr git hreset "reset --hard"
subcommand_abbr git cp cherry-pick
subcommand_abbr git cherrypick cherry-pick
subcommand_abbr git dif diff

# some of my git aliases
subcommand_abbr git db diffbranch
subcommand_abbr git dbt diffbranch-that

# can only do one of these unless I adopt lucas's setup.
subcommand_abbr npm i install
#subcommand_abbr pnpm i "install"

abbr mtr "sudo mtr"

# is it a `main` or a `master` repo?
alias gitmainormaster="git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1"
alias main="git checkout (gitmainormaster)"
alias master="main"

# ag defaults. go as wide as terminal (minus some space for line numbers)
# i used to like `--follow --hidden` but dont anymore. -follow ends up with lots of fstat errors on broken symlinks. and --hidden is something that should be turned on explicitly.
# OKAY RIPGREP is way faster than AG. i gotta drop ag like its hot.
#        also ripgrep doesnt buffer output so you can pipe it somewhere and it'll go as it happens.  wow yah SO much better.
alias ag='command ag -W (math $COLUMNS - 14)'

# fd is fast but their multicore stuff is dumb and slow and bad. https://github.com/sharkdp/fd/issues/1203
alias fd='command fd -j1 --exclude node_modules'
# By default watchexec thinks the project origin is higher up.  So dumb.
alias watchexec='command watchexec --project-origin . --ignore node_modules'

# for counting instances.. `ag -o 'metadata","name":".*?"' trace.json | sorteduniq`
alias sorteduniq="sort | uniq -c | sort --reverse --ignore-leading-blanks --numeric-sort" # -rbn
alias sorteduniq-asc="sort | uniq -c | sort --ignore-leading-blanks --numeric-sort" # -bn

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

alias hosts='sudo $EDITOR /etc/hosts' # yes I occasionally 127.0.0.1 twitter.com ;)

alias resetmouse='printf '"'"'\e[?1000l'"'"

alias dotfiles="subl ~/code/dotfiles" # open dotfiles for viewing

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
# wget sucks with certificates. Let's keep it simple.
alias wget="curl -O"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

alias ungz="gunzip -k"

# File size
alias fs="stat -f \"%z bytes\""

# emptytrash written as a function

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'

# project-specific shorthands

alias li=lighthouse
alias lperf 'lighthouse --only-categories=performance'
alias comp 'node build/build-report-components.js && yarn eslint --fix report/renderer/components.js'
alias reportunit 'yarn jest (find report -iname "*-test.js" | grep -v axe)'
# pretty sure watchexec has just won my heart after years of using `entr`
alias reportwatch 'watchexec "node build/build-report-components.js && node build/build-report.js --psi && node build/build-sample-reports.js && echo \$(date) && yarn eslint --fix report/renderer/components.js" && bash core/scripts/copy-util-commonjs.sh'

# dt. rpp
alias rppunit 'npm run unittest -- --expanded-reporting --mocha-fgrep=Processor\|Timeline\|trace\|Trace\|Appender\|Handler\|Performance'
alias rppinter 'npm run interactionstest -- --test-file-pattern="*/performance/**"'
alias rppscreen 'third_party/node/node.py --output scripts/test/run_test_suite.js --config test/interactions/test-runner-config.json --mocha-fgrep "[screenshot]" --test-file-pattern="*/performance/**"'

abbr xpraclient "xpra attach --video-scaling=off --desktop-scaling=off --dpi=96  --ssh=/usr/bin/ssh 'ssh://glurp/:110'"