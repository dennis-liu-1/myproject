# Non-travis variables used by this script.
TARGET_REPOSITORY="git@github.com:dennis-liu-1/myproject.git"
TARGET_DOC_DIR="."
SOURCE_DOC_DIR="_build/html"
SOURCE_DIR=`pwd`
SOURCE_LANG='en'

SOURCE_REPOSITORY="git@github.com:dennis-liu-1/myproject.git"
pwd
# Build the documentation.
echo "make html"
make html
echo "end of make html"

git config user.name "Qiskit Autodeploy"
git config user.email "qiskit@qiskit.org"

set -e
openssl aes-256-cbc -K $encrypted_43156c1f40d1_key -iv $encrypted_43156c1f40d1_iv -in github_deploy_key.enc -out github_deploy_key -d
chmod 600 github_deploy_key
eval $(ssh-agent -s)
ssh-add github_deploy_key

rm -rf ./_build/doctrees
rm -rf ./_build/html/_sources
mkdir html
cp ./_build/html html
git add html
git commit -m "Added html pages" -m "Commit: $TRAVIS_COMMIT" -m "Travis build: https://travis-ci.com/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID"
echo "git push"
git push --quiet
