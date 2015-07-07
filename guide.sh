#!/usr/bin/bash


# note that zsh is only enabled on my own mac

declare STATUS
declare USER_OPTION_Operation
declare USER_OPTION_OS
declare USER_OPTION_Ver
declare enBACKUP=n
declare enCLEAN=n
declare enLINK=n



# three actions: backup, clean, build the links
# functions
# para: n/a, for clean, the general list will do
func_CLEAN(){
	while read -r line
	do
		rm -rf ../.$line
	done < list_general
}

# para: n/a, for backup the general list will do
func_BACKUP(){
	mkdir -p ../.dotfiles_backup
	while read -r line
		do
			cp -r ../.$line ../.dotfiles_backup/$line
	done < list_general
}



# para: list
func_LINK_helper(){
	while read -r line
	do
		ln -s ./dotfiles/$line ../.$line
	done < $1
}
# para: os ver
func_LINK(){
	if [ $1 = "mac" ]
		then
			if [ $2 = "me" ]
				then
				# there is the ros bash problem
					func_LINK_helper ./list_mac_me
					rm ../.bashrc_mac_me
					ln -s ./dotfiles/bashrc_mac_me ../.bash_profile
					ln -s ./dotfiles/bashrc_ros ../.bashrc
			elif [ $2 = "pub" ]
				then
					func_LINK_helper ./list_mac_pub
					rm ../.bashrc_mac_pub
					ln -s ./dotfiles/bashrc_mac_pub ../.bash_profile
			fi

	elif [ $1 = "ubuntu" ]
		then
			if [ $2 = "me" ]
				then
					func_LINK_helper ./list_ubuntu_me
					rm ../.bashrc_ubuntu_me
					ln -s ./dotfiles/bashrc_ubuntu_me ../.bashrc
			elif [ $2 = "pub" ]
				then
					func_LINK_helper ./list_ubuntu_pub
					rm ../.bashrc_ubuntu_pub
					ln -s ./dotfiles/bashrc_ubuntu_pub ../.bashrc
			fi
	fi
}

func_MOVE_helper(){
	while read -r line
	do
		mv $line TEMP_FOLDER
	done < $1
}
# para: os ver
func_ISOLATION(){
	mkdir -p TEMP_FOLDER
	# first copy the tools
	mv guide.sh list_general bashrc_common bashrc_colors TEMP_FOLDER/

	if [ $1 = "mac" ]
		then
			if [ $2 = "me" ]
				then
					func_MOVE_helper list_mac_me
			elif [ $2 = "pub" ]
				then
					func_MOVE_helper list_mac_pub
			fi

	elif [ $1 = "ubuntu" ]
		then
			if [ $2 = "me" ]
				then
					func_MOVE_helper ./list_ubuntu_me
			elif [ $2 = "pub" ]
				then
					func_MOVE_helper ./list_ubuntu_pub
			fi
	fi
	ls -A1 | grep -v TEMP_FOLDER | xargs rm -rf
	mv ./TEMP_FOLDER/* .
	rm -r TEMP_FOLDER
}

func_RESTORE(){
	func_CLEAN
	mv ../.dotfiles_backup/* ../
	cd ..
	rm -rf dotfiles
	rm -rf .dotfiles_backup
}

STATUS=0

echo "====================\nDotfiles Setup Guide \nversion 1 \nby huangzonghao\n====================\n"
echo "Make sure that this is ~/dotfiles before you move on"

# Frist ask for the setup specifications
while [ $STATUS -eq 0 ]
do
	echo "Installation or restore? (i, r)"
	read USER_OPTION_Operation
	if [ $USER_OPTION_Operation = "i" ]
		then
			STATUS=1
			enLINK="y"

	elif [ $USER_OPTION_Operation = "r" ]
		then STATUS=21 # wow, timmy D!
	fi
done

while [ $STATUS -eq 1 ]
do
	echo "Operating System? (mac, ubuntu)"
	read USER_OPTION_OS
	if [ $USER_OPTION_OS = "mac" ] || [ $USER_OPTION_OS = "ubuntu" ]
		then let STATUS=$STATUS+1
	fi
done

while [ $STATUS -eq 2 ]
do
	echo "Private or Public? (me, pub)"
	read USER_OPTION_Ver
	if [ $USER_OPTION_Ver = "me" ] || [ $USER_OPTION_Ver = "pub" ]
		then let STATUS=$STATUS+1
	fi
done

while [ $STATUS -eq 3 ]
do
	echo "Need to backup the original files before install? (y, n)"
	read enBACKUP
	if [ $enBACKUP = "y" ] || [ $enBACKUP = "n" ]
		then let STATUS=$STATUS+1
	fi
done

while [ $STATUS -eq 4 ]
do
	echo "Clean the existing dotfiles first? (y, n)"
	read enCLEAN
	if [ $enCLEAN = "y" ] || [ $enCLEAN = "n" ]
		then let STATUS=$STATUS+1
	fi
done

# now start the operations
if [ $STATUS -eq 5 ]
	then
		if [ $enBACKUP = "y" ]
			then
				func_BACKUP
		fi

		if [ $enCLEAN = "y" ]
			then
				func_CLEAN
		fi

		if [ $enLINK = "y" ]
			then
				func_LINK $USER_OPTION_OS $USER_OPTION_Ver
		fi

		if [ $USER_OPTION_OS = "mac" ]
			then source ~/.bash_profile
		elif [ $USER_OPTION_OS = "ubuntu" ]
			then source ~/.bashrc
		fi

		# check if need to clean up the irrelevant files on pub computers
		echo "Linking finished, need to clean up all the irrelevant file? (y, n)"
		declare USER_OPTION
		read USER_OPTION
		if [ $USER_OPTION = "y" ]
			then
				func_ISOLATION $USER_OPTION_OS $USER_OPTION_Ver
		fi
fi

if [ $STATUS -eq 21 ]
	then
		echo "Now we are gonna delete the entire dotfiles folder and copy your backuped files, are you sure? (y, n)"
		read USER_OPTION
		if [ $USER_OPTION = "y" ]
			then
				func_RESTORE
				echo "Restoring finished."
		fi
fi

echo "All processes done successfully, exit."



