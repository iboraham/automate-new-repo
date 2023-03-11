# read repo name
echo "Please provide repository name"
read -r repo_name

# repo desc
echo "Please provide repository description"
read -r desc

echo "What is your username"
read -r username


mkdir "/Users/onur/Documents/GitHub/${repo_name}"
cd "/Users/onur/Documents/GitHub/${repo_name}"

# Create repository
git init
touch README.MD
git add README.MD
git commit -m 'initial automated setup' 

curl -u ${username} https://api.github.com/user/repos -d "{\"name\": \"${repo_name}\", \"description\": \"${desc}\", \"license_template\": \"mit\", \"auto_init\": \"true\"}"

git remote add origin https://github.com/${username}/${repo_name}.git
git push --set-upstream origin master

cd "~/Documents/GitHub/${repo_name}"

echo "Mission Completed"
echo " *** You're now in your project root. *** "
