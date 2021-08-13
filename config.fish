# set -U fish_user_paths $fish_user_paths $HOME/.local/bin
# set -U fish_user_paths $fish_user_paths /usr/local/bin
# set -U fish_user_paths $fish_user_paths /usr/bin
# set -U fish_user_paths $fish_user_paths /opt/homebrew/bin/ 

set fish_greeting           # Turns off the intro message when pulling up fish shell
set EDITOR "nvim"           # Sets $EDITOR to vim

test $TERM != "screen"; and exec tmux

set -g theme_date_format "+%a %Y/%m/%d %H.%M"

### Abbreviations  ###

abbr n 'nvim'
abbr nv 'nvim'
abbr df 'df -h'
abbr free 'free -g'
abbr h 'cd ~/'
abbr cc 'clear'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr v 'nvim'
abbr vim 'nvim'
abbr ll 'ls -l'
abbr la 'ls -A'
abbr ls. 'ls -A | egrep "^\."'
abbr q 'exit'
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr rm 'rm -i'
abbr --add set_fish 'set -U fish_user_paths $fish_user_paths <path>'
abbr --add unset_fish 'set --erase <variable>'
abbr --add swap 'rm ~/.local/share/nvim/swap/*.swp'
abbr --add code_find 'find ./  -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files'
abbr --add code_cscope 'cscope -Rbq -i cscope.files'
abbr --add xrandr_on 'xrandr --output <DP-1/DP-2> --right-of eDP-1 --auto'
abbr --add xrandr_off 'xrandr --output <DP-1/DP-2> --off'

set os_type (uname -s)

if [ "$os_type" = "Linux" ]

function audio_reflesh
    pulseaudio --k
    pulseaudio --start 
    i3 restart > /dev/null 
end

# Custom function for line counting
function line-count
    wc -l | string trim
end

# Custom function for counting installed programs
function count-installed
    dpkg -l | grep -c '^ii' | string trim
end

# Custom function for listing installed programs
function list-installed
    apt list --installed | string trim
end

# Custom function for listing ram hogs
function memhogs
    ps axh -o cmd:15,%mem --sort=-%mem | head | string trim
end

# Custom function for listing cpu hogs
function cpuhogs
    ps axh -o cmd:15,%cpu --sort=-%cpu | head
end

# Function to find resolutions of monitors
function resolution
    xrandr | grep \* | sed 's/59.95\*+//g'
end

# Function to print percent used hdd space of home folder
function hdd
    df -h /home | grep /dev | awk '{print $3 "/" $5}'
end

# Function to see available storage in home folder
function avail
    df -h /home | grep /dev/ | awk '{print $4}'
end

end
# end if for Linux

function codebase 
    find ./ -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files
    cscope -Rbq -i cscope.files
end 


# Modify from fishbone greeting

function fish_greeting -d "Greeting message on shell session start up"
    set --local os_type (uname -s)

    set_color $fish_color_autosuggestion
    echo ""
    set_color D1E9E9
    printf (show_user_info)
    set_color C4E1E1
    printf (show_shell_info)
    set_color B3D9D9
    printf (show_os_info)
    set_color A3D1D1
    if [ "$os_type" = "Linux" ]
        printf (show_net_info)
    end 
    set_color 95CACA
    printf (show_cpu_info)
    set_color 81C0C0

    if [ "$os_type" = "Linux" ]
        printf (show_cpu_usage)
    end
    set_color 6FB7B7
    printf (show_ssd_info)
    set_color 5CADAD
    
    if [ "$os_type" = "Linux" ]
        printf (show_mem_info)
    end 
    set_color 4F9D9D
    
    if [ "$os_type" = "Linux" ]
        printf (show_media_info)
    end
    echo ""
    set_color normal
end

function show_user_info -d "Prints user info"
    set --local os_type (uname -s)

    if [ "$os_type" = "Linux" ]
        printf '%*s' $COLUMNS "$USER@$hostname"
    else if [ "$os_type" = "Darwin" ]
        printf '%*s' $COLUMNS "$USER@Macbook"
    end
end

function show_shell_info -d "Prints shell info"
    printf '%*s' $COLUMNS (fish -v)
end

function show_ssd_info -d "Prints ssd info"
    set ssd_info (df -h / | grep /dev | awk '{print $3 "/" $2}')
    printf '%*s' $COLUMNS "Disk usage: $ssd_info"
end

function show_media_info -d "Prints media info"
    set user (ls -A /media/)
    if [ $user ]
        set media (ls -A /media/$USER)
        if [ $media ] 
            printf '%*s' $COLUMNS "Media: $media"
        else 
            printf '%*s' $COLUMNS "Media: not mounted"
        end 
    else
        printf '%*s' $COLUMNS "Media: not mounted"
    end
end

function show_cpu_usage -d "Print cpu usage"
    set cpu_usage (grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}')
    printf '%*s%s' (math $COLUMNS-1) "CPU usage: $cpu_usage" "%%"
end

function show_os_info -d "Prints operating system info"

    set os_info (uname -smr)
    printf '%*s' $COLUMNS $os_info
end

function show_cpu_info -d "Prints iformation about cpu"

    set --local os_type (uname -s)
    set --local cpu_info ""

    if [ "$os_type" = "Linux" ]

        set --local procs_n (grep -c "^processor" /proc/cpuinfo)
        set --local cores_n (grep "cpu cores" /proc/cpuinfo | head -1 | cut -d ":"  -f2 | tr -d " ")
        set --local cpu_type (grep "model name" /proc/cpuinfo | head -1 | cut -d ":" -f2)
        set cpu_info "$cpu_type, $procs_n processors, $cores_n cores"

    else if [ "$os_type" = "Darwin" ]

        # set --local procs_n (system_profiler SPHardwareDataType | grep "Total Number of Cores" | cut -d ":" -f2 | tr -d " ")
        set --local cores_n (system_profiler SPHardwareDataType | grep "Total Number of Cores" | cut -f2 -d ':' | cut -c 2)
        set --local cpu_type (system_profiler SPHardwareDataType | grep "Chip" | cut -d ":" -f2 | tr -d " ")
        set cpu_info "Macbook $cpu_type, $cores_n cores"
    end

    printf '%*s' $COLUMNS $cpu_info
end

function show_mem_info -d "Prints memory information"

    set --local os_type (uname -s)
    set --local total_memory ""

    set mem_total (free -h | grep "Mem" | awk '{print $2}')
    set mem_used (free -h | grep "Mem" | awk '{print $3}')
    printf '%*s' $COLUMNS "Memory usage: $mem_used/$mem_total"
end

function show_net_info -d "Prints information about network"

    set --local os_type (uname -s)
    set --local ip ""
    set --local gw ""

    set ip (ip address show | grep -E "inet .* brd .* dynamic" | cut -d " " -f6)
    set gw (ip route | grep default | cut -d " " -f3)

    printf '%*s' $COLUMNS "Ip address $ip, default gateway $gw"
end

