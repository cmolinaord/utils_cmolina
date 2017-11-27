.PHONY: all hourly_notification auto_nfs_mount crontab_set

all:
	@echo "Run 'make <program>' to install the desired program"

hourly_notification:
	sudo install -Dm755 date_notification.sh /usr/bin/notify_date
	crontab_set
	sudo systemctl enable cronie.service
	sudo systemctl start cronie.service
	echo "Configured hourly notification using crontab"

auto_nfs_mount: crontab_set
	sudo install -Dm755 auto_nfs_mount.sh /usr/bin/auto_nfs_mount
	sudo systemctl enable cronie.service
	sudo systemctl start cronie.service
	echo "Configured auto NFS mount system"

crontab_set:
	crontab crontab_cmolina
