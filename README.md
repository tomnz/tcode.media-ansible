# tcode.media Ansible Config

## Deploying

Assuming a (fresh) standard VM with latest debian:

- SSH into the VM:
  - `ssh -i (private_key_file) (username)@(public_ip)`
- Clone this repository:
  - `git clone https://github.com/tomnz/tcode.media-ansible.git`
  - `cd tcode.media-ansible`
- Configure prerequisites (view setup.sh for details):
  - `chmod +x setup.sh`
  - `sudo bash -c './setup.sh'`
- Provision Ansible:
  - `ansible-galaxy install -r requirements.yml`
  - `ansible-playbook -v -i hosts.yml playbook.yml`

## Updating

- SSH into the VM.
  - `ssh -i (private_key_file) (username)@(public_ip)`
- Pull the repository:
  - `cd ~/tcode.media-ansible`
  - `git pull`
- Provision Ansible:
  - `ansible-playbook -v -i hosts.yml playbook.yml"`

## Testing with Vagrant

Test the configuration (both initial setup, and further updates) locally using [Vagrant](https://www.vagrantup.com/).

The `Vagrantfile` defines two VMs:

- `tcode.media` is the main VM which mimics a cloud VM.
- `controller` is a secondary VM which is used to remotely provision `tcode.media` using the Ansible playbook.

[Install Vagrant](https://www.vagrantup.com/docs/installation) and a suitable provider for your OS such as VirtualBox. On Windows I recommend running inside WSL with the [additional setup steps](https://www.vagrantup.com/docs/other/wsl).

### Running for the first time

    vagrant up

Once the node is provisioned, you should now be able to confirm that the web server is running at: [http://172.17.177.21:3000](http://172.17.177.21:3000)

### SSH into VM for testing

    vagrant ssh tcode.media
    # Run any commands you like from here, e.g.
    docker logs nginx

### Testing an incremental Ansible run

This is useful for validating idempotent Ansible runs - making sure updates happen, data isn't wiped out, etc.

    vagrant provision --provision-with playbook

### Testing a new Ansible run

    vagrant destroy
    vagrant up
