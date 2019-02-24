# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{bash_prompt,exports,aliases,secret}; do
    echo "LOADED ${file}"
    [ -r "$file" ] && source "$file"
done
unset file
