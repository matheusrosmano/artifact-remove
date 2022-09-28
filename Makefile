tag-remove:
	git tag -d $(tag_version)

commit-by-tag:
	git tag -am "$(commit_message)" $(tag_version)

git-push-with-tags:
	git push --tags -f