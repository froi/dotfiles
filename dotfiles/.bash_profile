# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{bash_prompt,exports,aliases,secret}; do
    echoGreen "LOADED ${file}"
    [ -r "$file" ] && source "$file"
done
unset file

echo -e "\n"
echoGreen "LOADED virtualenvwrapper.sh"
source /usr/local/bin/virtualenvwrapper.sh

echo -e "\n"
echoGreen "LOADED NVM"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
