# Ansible Samba Workstation

Accessing files from your remote workstation/VM has never been so easy! Simply run this role which will allow your local computer to access the remote filesystem by creating a mounted drive. Now, you can seamlessly browse files through a window, transfer files between systems, or open your files with your favorite IDE/text editor.

## Variables

|Field|Required|Type|Default|Description|
|---|---|---|---|---|
|smb_config_sections|yes|list[dict]|See below|A list of `smb.conf` sections and their configurations.|

### smb_config_sections structure

The `smb_config_sections` variable found in `defaults/main.yml` is a list of dicts where each item in the list contains the following structure:

|Field|Required|Description|
|---|---|---|---|
|name|yes|The name of the section in the configuration.|
|path|yes|The value corresponding to the `path` configuration option in the current section.|
|force_user|yes|The value corresponding to the `force user` configuration option in the current section.|
|create_mask|yes|The value corresponding to the `create mask` configuration option in the current section.|
|directory_mask|yes|The value corresponding to the `directory mask` configuration option in the current section.|
|guest_ok|no|The value corresponding to the `guest ok` configuration option in the current section.|
|writeable|no|The value corresponding to the `writeable` configuration option in the current section.|
|browseable|no|The value corresponding to the `browseable` configuration option in the current section.|

The default value of `smb_config_sections` exposes the entire filesystem of the remote host under the `public` endpoint.

## Creating the Mount

### Windows

### Linux

### Mac

## License

MIT. See [LICENSE](LICENSE.md) for more information.
