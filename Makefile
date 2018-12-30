install_server:
	ansible-playbook scripts/playbook.yml

install_nginx:
	ansible-playbook scripts/playbook.yml --tags "nginx"
