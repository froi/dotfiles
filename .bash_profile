# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{extras,bash_prompt,exports,aliases,functions,secret}; do
    [ -r "$file" ] && source "$file"
done
unset file

source /usr/local/bin/virtualenvwrapper.sh

export JBOSS_HOME=/usr/local/opt/jboss-as/libexec
export PATH=${PATH}:${JBOSS_HOME}/bin
