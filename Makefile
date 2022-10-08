tag-remove:
	git tag -d $(tag_version)

commit-by-tag:
	git tag -am "$(commit_message)" $(tag_version)

git-push-with-tags:
	git push --tags -f

docker-build:
	docker build -t remove-artifacts . --no-cache

docker-run:
	docker run -it remove-artifacts