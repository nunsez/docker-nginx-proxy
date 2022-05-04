bundle:
	bundle check || bundle install --jobs $(shell nproc)

stop-server:
	rm -f tmp/pids/server.pid

start: stop-server bundle
	bundle exec rails server --port 3000 --binding 0.0.0.0 --environment development

start-staging: stop-server bundle
	bundle exec rails server --port 3000 --binding 0.0.0.0

start-production: stop-server
	bundle exec rails server --port 3000 --binding 0.0.0.0 --environment production

docker-clean-builds:
	docker rmi $(shell docker images --filter "dangling=true" --quiet)
