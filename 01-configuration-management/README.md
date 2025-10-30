# Configuration Management Solutions

## Question 1: Display all ansible_ configuration for a host

**Answer:**
```bash
ansible hostname -m setup
```

**Explanation:**
The `setup` module in Ansible gathers facts about remote hosts. This command displays all ansible_ variables including ansible_hostname, ansible_os_family, ansible_distribution, ansible_processor, ansible_memtotal_mb, etc.

**Example:**
```bash
ansible app-vm1.fra1.internal -m setup
```

To filter specific facts:
```bash
ansible hostname -m setup -a "filter=ansible_eth*"
```

## Question 2: Cron job for logrotate every 10 minutes between 2h-4h

See: `ansible/logrotate_cron.yml`

## Question 3: Deploy ntpd package with custom config

See: `ansible/ntpd_deployment.yml`
