SHELL_NAME := scripts/commands.sh

.PHONY: init kill kill-v dev

init:
	bash $(SHELL_NAME) -t deploy-local -a DEPLOY_ENV=dev

kill:
	bash $(SHELL_NAME) -t kill-local

kill-v:
	bash $(SHELL_NAME) -t kill-local -a -v

dev:
	docker exec -it app /bin/bash