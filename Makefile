install_server:
	ansible-playbook playbook.yml

install_nginx:
	ansible-playbook playbook.yml --tags "nginx"
