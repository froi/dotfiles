# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

dir="${pwd}"
parentDir="$(dirname "$dir")"
source "${parentDir}/utils.sh"

# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{bash_prompt,exports,aliases,secret}; do
    echoGreen "LOADED ${file}"
    [ -r "$file" ] && source "$file"
done
unset file
