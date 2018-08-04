import pytest


def test_samba_service(host):
    service = host.service("smbd")
    assert service.is_running
    assert service.is_enabled


def test_samba_config(host):
    file = host.file("/etc/samba/smb.conf")
    assert file.exists
    assert file.is_file


def test_port_usage(host):
    assert host.socket("tcp://0.0.0.0:137").is_listening
    assert host.socket("udp://0.0.0.0:137").is_listening
    assert host.socket("udp://0.0.0.0:138").is_listening
    assert host.socket("tcp://0.0.0.0:139").is_listening
    assert host.socket("tcp://0.0.0.0:445").is_listening
