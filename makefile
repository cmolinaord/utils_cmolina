all:
	@echo "Run 'make <program>' to install the desired program"

hourly_notification:
	sudo install -Dm755 date_notification.sh /usr/bin/notify_date
	crontab crontab_cmolina
	sudo systemctl enable cronie.service
	sudo systemctl start cronie.service
	echo "Configured hourly notification using crontab"
