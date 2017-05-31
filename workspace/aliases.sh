#! /bin/bash

# Colors used for status updates
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Laravel / PHP Alisases
alias art="php artisan"
alias artisan="php artisan"
alias cdump="composer dump-autoload -o"
alias composer:dump="composer dump-autoload -o"
alias db:reset="php artisan migrate:reset && php artisan migrate --seed"
alias migrate="php artisan migrate"
alias seed="php artisan:seed"
alias phpunit="./vendor/bin/phpunit"
