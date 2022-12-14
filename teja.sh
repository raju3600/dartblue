#!/bin/bash

echo "*** Automating Git Add, Commit and Push ***"

#Ask for Username


echo "Enter your GitHub username: "


read username


#Ask for User Github's personal access token

echo "Enter your GitHub personal access token: "

read token

# Ask for repository name

echo "Enter repository name"

read repoName

# Check if repository exists at GitHub

curl -k "https://api.github.com/repos/${username}/${repoName}.git"

# If repository exits then

if [ $? -eq 0 ]; then
   
    cd $repoName
    
    # Display unstaged files
    
    git status
    
    git remote set-url origin https://${token}@github.com/${username}/${repoName}.git
    
    # If there are any uncommited and unstatged files, ask user to commit them
    

    if [ "$(git status --porcelain)" ]; then
       
	    echo "There are uncommited and unstatged files. Commit them before pushing"
            
	    echo "Enter commit message"
            
	    read commitMessage
            
	    git add .
            
	    git commit -m "$commitMessage"

	    git push 


            for i in $(git show-ref --heads | sed 's/.*refs\/heads\///');

            do
		   

		    git checkout $i

		 


		    git log --oneline

		    read commitid

		    git cherry-pick $commitid


                    git push  $(i)
            done



		   # git checkout $i++ 

		    #git cherry-pick $cherrypick


                    #git push  $i++


                   # git push origin $(branch)
	   #done

            
	    echo "Files pushed to GitHub"
        

        
       
    fi
fi

#for branch in $(git show-ref --heads | sed 's/.*refs\/heads\///');

#do 
	

#	git push origin $(branch) 
#done


