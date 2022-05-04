bundle:
	bundle check || bundle install --jobs $(shell nproc)

start:
	rm -f tmp/pids/server.pid
	make bundle
	bundle exec rails server --port 3000 --binding 0.0.0.0


start-production:
	rm -f tmp/pids/server.pid
	make bundle
	bundle exec rails server --port 3000 --binding 0.0.0.0 --environment production
