#!/bin/bash

# Setup for portable programs.
# To be stored in a directory with structure like:
#
# home_.config_Code
# home_.local_bin_vs-code-exec
# home_.local_share_applications_VSCode
# home_.local_share_icons_vs-code-logo.png
# home_.vscode
# setup.sh
#
# On running the script, the directories are symlinked to the respective location.
# Example:
# home_.local_share_applications_VSCode will be symlinked to $HOME/.local/share/applications/VSCode
# And required directories will be created.
#
# Options:
# -f: If a previous symlink is present with the same name and refers to a different location, the symlink will be removed and new will be created.
#     This does affects only symlinks. Any file with same name will not be touched.
# -ff: Any file / directory / symlink with same name will be deleted (directory will be deleted even if not empty) and new symlink will be created.
#
# Optional argument: A custom loaction where the above directories are present.
#
# Examples:
# ./setup.sh                     # check the current folder for the above directory structure
# ./setup.sh -f                  # same as above but replace incorrect symlinks only
# ./setup.sh -ff                 # delete file / directory if present and create symlink
# ./setup.sh /run/media/src/Stuff/dev/IDEs/config_vscode                   # cd to this directory before running
# ./setup.sh -ff /run/media/src/Stuff/dev/IDEs/config_vscode

my_name=`basename "$0"`    # script name
default_home_directory=`readlink -f ~`     # canonical path of home

replace_symlink=
replace_files=

# take hyphenated options
while :; do
    case $1 in
      -f)
        echo "Incorrect symlinks will be replaced."
        replace_symlink=1
        ;;
      -ff)
        echo "Incorrect symlinks will be replaced."
        echo "Files will be deleted if present."
        replace_files=1
        ;;
      --)              # End of all options.
        shift
        break
        ;;
      -?*)
        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
        ;;
      *)               # Default case: No more options, so break out of the loop.
        break    
    esac

    shift
done

echo

# any remaining argument is a custom path
custom_path="."
if [[ -n "$1" ]]; then
  if [[ -e "$1" ]]; then
    custom_path="$1"
    echo "Custom path: $1"
    echo
  else
    echo "Path does not exisy: $1"
    exit
  fi
fi

cd $custom_path

createSymLink() {
  ln -s "$1" "$2"
  action_type="Created"
  if [[ -n "$3" ]]; then
    action_type="$3"
  fi
  if [[ "$?" == "0" ]]; then
    echo "$action_type: $symPath"
  fi
}

while read -r path                                         
do
  if [[ "$path" != "$my_name" ]]; then
  
    # split with delimiter _
    IFS=':'; segments=(${path//_/:}); unset IFS;
    first_segment="${segments[0]}"
    length=`echo "${#segments[@]}"`
    last=$(($length-1))
    
    # path to create before putting the respective symlinks
    mkdirPath=""
    
    # create path from index 1. Index 0 has 'home' or something else. Adjustment done later.
    for ((i=1; i<=$last-1; i++))
    do
      mkdirPath="$mkdirPath/${segments[$i]}"
    done
    
    # Remove front slash
    mkdirPath=${mkdirPath:1}
    
    # Check if index 0 is "home". If yes, add the canonical path of home at beginning.
    if [[ "${segments[0]}" == "home" ]]; then
      mkdirPath="$default_home_directory/$mkdirPath"
    else
      mkdirPath="${segments[0]}/$mkdirPath"
    fi
    
    # create the directories
    mkdir -p $mkdirPath
    
    # proceed if mkdir was successful
    if [[ "$?" == "0" ]]; then
    
      symPath="$mkdirPath/${segments[$last]}"     # full path (with name) of the symlink file to be created
      fullPath=`readlink -f "$path"`              # full path of the source file / directory
      
      # check if the symlink file is already present.
      if [[ -e "$symPath" ]]; then
        
        # check if the symlink file refers to the same file which we are trying to link to
        existsFullPath=`(readlink -f "$symPath")`
        if [[ -L "$symPath" && "$existsFullPath" == "$fullPath" ]]; then
          echo "Symlink exists: $symPath"
          
        # option: -f
        # delete symlink file and create new
        elif [[ -L "$symPath" ]] && [[ $replace_symlink || $replace_files ]]; then 
          rm "$symPath"
          createSymLink "$fullPath" "$symPath" "Replaced symlink"

        # option: -ff
        # delete file / directory and create sym link
        elif [[ $replace_files ]]; then 
          rm -rf "$symPath"
          createSymLink "$fullPath" "$symPath" "Deleted file/directory. Created symlink"
          
        # default. No option.
        else
          echo "File exists: $symPath"
        fi
        
      else
        # if symlink does not exist, then create it.
        createSymLink "$fullPath" "$symPath"
      fi
    else
      echo "Failed to create path: $mkdirPath"
    fi
  fi
done < <(ls)
