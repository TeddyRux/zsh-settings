# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias prodbe="NODE_ENV=production node app.js --port 4000 --w 0"
alias prodfe="sudo NODE_ENV=production node app.js --port 80 --w 0 --url http://localhost:4000"
alias backend="nodemon app.js --w 0"
alias frontend=frontend
frontend() {
	ulimit -n 4096
	if [ -z "$1" ];	then
		nodemon app.js --w 0 --url=http://localhost:4000
	else 
		nodemon app.js --w 0 --url $1
	fi
}
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias npmi="rm -rf node_modules && npm install"
alias branch=branch
branch() {
	git fetch --all
	if [ -z "$2" ];	then
		git checkout -b $1 bb/master
	else 
		git checkout -b $1 bb/$2
	fi
}
alias del=del
del() {
	git branch -D $1
}
alias storc="sudo node app --mongodb:username test --mongodb:password test --mongodb:database test"
alias storcdb="node update_db.js --mongodb:username test --mongodb:password test --mongodb:database test"

alias sslgen=sslgen
sslgen() {
	openssl genrsa -out ssl-key.pem 1024
	openssl req -new -key ssl-key.pem -out certrequest.csr
	openssl x509 -req -in certrequest.csr -signkey ssl-key.pem -out ssl-cert.pem
}

alias repos=repos
repos() {
	if [ "$1" != "" ];	then
		git clone git@github.com:TeddyRux/$1.git
		cd $1
		git remote add bb git@github.com:brandingbrand/$1.git
		git fetch --all
		git pull bb master
		npmi
	fi
}
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
