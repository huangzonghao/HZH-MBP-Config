########################################################################
### be very careful of the spaces when you write the bash functions ####
########################################################################


#just for fun --Thu May 21 14:57:27 HKT 2015
#alias gcc="gcc-5"
#alias g++="g++-5"

#for ros --Fri May 22 13:30:22 HKT 2015
alias ros="source ~/ros_catkin_ws/install_isolated/setup.bash && echo ros enabled"
source ~/ros_catkin_ws/install_isolated/setup.bash
#export PATH="/usr/local/bin:$PATH"



#settings for the layout of the bash --Tue Apr  7 17:27:17 HKT 2015
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[31m\]Bash for ROS \[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="\e[1;31mBash for ROS\e[m\e[1;33m:\w\$\e[m "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad


# a small function to change the iterm background color  --Wed Apr  8 03:29:48 HKT 2015
setWhiteBackground() {
        echo -e "\033]Phffffff\033\\"
        echo -e "\033]Pg000000\033\\"
}

# a function to clear the history in iterm --Wed Apr  8 09:31:42 HKT 2015
clearScrollback(){
        echo -e "\033]50;ClearScrollback\a"
}

# path for open cv
#export PATH="/usr/local/include/opencv2:$PATH"

# resetting the java path for mac ox x mavericks --by huangzonghao@2014.7.15
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# set some alias for the ls commands --by huangzonghao@2014.7.18
alias ls="ls -G"
alias la="ls -AG"
alias ll="ls -aoghlGF"


# set the alias for latexmk -- by huangzonghao@2014.10.4
alias laclean="rm  *.out *.dvi *.aux *.fdb_latexmk *.fls *.log *.ps"
alias lmk="latexmk -xelatex -pvc -pdf *.tex"
#alias lmk="latexmk -pvc -pdf *.tex"


# matlab cmd mode
alias matlab="/Applications/MATLAB_R2014a.app/bin/matlab -nodesktop"
alias mt="cd ~/TEMP/matlab && /Applications/MATLAB_R2014a.app/bin/matlab -nodesktop"

# a function to package all the templates --Tue Apr  7 13:01:39 HKT 2015
createTemplate(){
        declare STATUS   # use declare to make all the variable local
        declare OPTION
        declare USER_OPTION
        declare FILE_NAME
        #declare USER
        if [ $# -eq 0 ]
                then 
                        STATUS=0
                else
                        STATUS=1
                        OPTION=$1
        fi
        
        while [ $STATUS -eq 0 ]
        do
                echo "The templates installed are latex, makefile, sbatch "
                echo "Please enter the type of the template: "
                read  USER_OPTION
                if [ $USER_OPTION == "latex" ]  || [ $USER_OPTION == "makefile" ] || [ $USER_OPTION == "sbatch" ]
                        then 
                                STATUS=1
                                OPTION=$USER_OPTION
                fi
        done

        case $OPTION in 
                "latex")
                        echo "Please enter the file name : "
                        read FILE_NAME
                        /bin/cp -i /Users/huangzonghao/.vim/template/latex.tex $FILE_NAME.tex; vim $FILE_NAME.tex;
                        ;;
                "makefile")
                        /bin/cp -i /Users/huangzonghao/.vim/template/makefile makefile && vim makefile
                        ;;
                "sbatch")
                        echo "CPU version or GPU version?"
                        read USER_OPTION
                        echo "Please enter the file name : "
                        read FILE_NAME
                        case $USER_OPTION in 
                                "cpu")
                                        /bin/cp -i /Users/huangzonghao/.vim/template/sbatchcpu.sh $FILE_NAME.sh && vim $FILE_NAME.sh
                                        ;;
                                "gpu")
                                        /bin/cp -i /Users/huangzonghao/.vim/template/sbatchgpu.sh $FILE_NAME.sh && vim $FILE_NAME.sh
                                        ;;
                        esac
                        ;;
        esac
}

alias tem="createTemplate"
#alias temla="CreateLatexTemlate"


alias cao="./executable"

alias cslab="ssh zhuangaj@csl2wk22.cse.ust.hk"
alias hosts="sudo vim /etc/hosts"


# short cut for the ielm professor server
#alias ielm="setWhiteBackground && expect /Users/huangzonghao/Expect/ielmssh.sh"

# alias for sshfs --Mon Jan 19 10:00:02 HKT 2015
#alias ielmmt="sshfs  hzh@verse.ielm.ust.hk:/Users/hzh/work ~/mount/ielm"
#alias ielmmt="expect /Users/huangzonghao/Expect/ielmmtssh.sh"
alias ielmumt="umount ~/mount/ielm"

#brand new alias after putting ssh pub key into the server
alias ielm="ssh hzh@verse.ust.hk"
alias ielmmt="sshfs  hzh@verse.ust.hk:/Users/hzh/work /Users/huangzonghao/mount/ielm"
alias 5580="ssh huangzonghao@143.89.47.8"
alias 5580mt="sshfs huangzonghao@143.89.47.8:/home /Users/huangzonghao/mount/5580"

# a small function to tell whether to enable the display mode or not --Thu Apr 16 23:23:50 HKT 2015
ConnectBigYellow(){
        setWhiteBackground
        if [ $# -eq 0 ]
                then
                        expect /Users/huangzonghao/Expect/bigyellow.sh
                else
                        if [ $1 == "X" ]
                                then
                                expect /Users/huangzonghao/Expect/bigyellowX.sh
                        fi
        fi
}
# alias for my big notebook --Wed Apr 15 01:47:16 HKT 2015
#alias bigyellow="ssh huangzonghao@143.89.220.80"
#alias bigyellow="setWhiteBackground && expect /Users/huangzonghao/Expect/bigyellow.sh"
alias bigyellow="ConnectBigYellow"
#alias bigyellowmt="sshfs  huangzonghao@143.89.220.80:/home/huangzonghao/Desktop/comp4332 ~/mount/bigyellow"
alias bigyellowmt="expect /Users/huangzonghao/Expect/bigyellowmt.sh"

# Mon Apr  6 17:15:29 HKT 2015
alias gpumt="expect /Users/huangzonghao/Expect/gpu1mt.sh"
alias gpu="setWhiteBackground && clearScrollback &&  expect /Users/huangzonghao/Expect/gpu1.sh"

# --Thu Jan 22 01:44:07 HKT 2015
#alias pan="cd /Users/huangzonghao/mount/ielm"


# alias for javascript interpretor --Thu Feb  5 16:48:50 HKT 2015
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"

#alias for the 5580 gpu server -- Feb 10
#alias 5580="expect /Users/huangzonghao/Expect/5580ssh.sh"
#alias 5580mt="sshfs ramp@143.89.47.8:/home/ramp /Users/huangzonghao/mount/5580"
#alias 5580mt="expect /Users/huangzonghao/Expect/5580mtssh.sh"

#alias for dot --Tue Mar  3 17:23:32 HKT 2015
ComplieDot() {
        if [ $# -eq 0 ] #the number of input arguments equal to zero
                then
                        /usr/local/bin/dot -Tpng -O *.dot;
                else 
                        /usr/local/bin/dot -Tpng -o $1.png $1.dot;
        fi
}
alias dt="ComplieDot"
#alias dt="/usr/local/bin/dot -Tpng -O"

#the function to beauitfy the js code -Sat Mar 28 14:19:03 HKT 2015
beautifyJS(){
        #if [ $# -eq 1]
        #then
                js-beautify -f $1 -r --type $2;
                #rm $1;
                #mv __temp_$1 $1;
        #fi
}
alias btf="beautifyJS"
#by the way this plugin is just garbage, you should use the plugin in the sublime text 3


#some funny commands
# sl fortune cowsay cmatrix figlet
# the alias for sublime text --Tue Apr 14 17:23:50 HKT 2015


# the alias for apache --Sun Apr 26 14:21:29 HKT 2015
alias apache="sudo apachectl"


# the setup for visual studio code --Sat May  9 12:07:11 HKT 2015
vsc () {
            if [[ $# = 0 ]]
                then
			echo shabileba;
                        open -a "Visual Studio Code"
                else
                        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
                        open -a "Visual Studio Code" --args "$F"
            fi
}

# add the git completion file --Sat May 16 16:57:16 HKT 2015
source /usr/local/git/contrib/completion/git-completion.bash


# add the brew completition file --Mon May 25 05:04:53 HKT 2015
#source $(brew --repository)/Library/Contributions/brew_bash_completion.sh


# alias for youtube-dl --Sun May 17 13:09:28 HKT 2015
alias ydl="youtube-dl"


# the function to kaiguang a cpp source file --Fri May 22 17:51:04 HKT 2015
kaiguang(){
	if [ $# -eq 0 ]
	then
		/bin/cat ~/.vim/template/godbless
	else
		/bin/cat ~/.vim/template/godbless $1 > TEMPFILE
		mv TEMPFILE $1
	fi
}


# the shortcut for making a directory and cd into it 
mcd(){
	if [ $# != '0' ]
	then
		mkdir $1;
		cd $1;
	fi
}
