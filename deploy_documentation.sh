# Non-travis variables used by this script.
TARGET_REPOSITORY="git@github.com:dennis-liu-1/myprojectfiles.git"
TARGET_DOC_DIR="."
SOURCE_DOC_DIR="_build/html"
SOURCE_DIR=`pwd`
SOURCE_LANG='en'

SOURCE_REPOSITORY="git@github.com:dennis-liu-1/myprojectfiles.git"

# Build the documentation.
echo "make html"
make html
echo "end of make html"

git config user.name "Qiskit Autodeploy"
git config user.email "qiskit@qiskit.org"

rm -rf _build/doctrees
rm -rf _build/html/_sources
mkdir html
cp _build/html html
git add html
git commit -m "Added html pages" -m "Commit: $TRAVIS_COMMIT" -m "Travis build: https://travis-ci.com/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID"
echo "git push"
git push --quiet
