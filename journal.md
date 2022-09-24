##### ***`Monday, 15th August`***
```markdown
Using ReadtheDocs.io to create a documentation for the project.
```

##### ***`Wednesday, 28th July`***
```markdown
Setting up a NAS in a virtual environment.This NAS can also be used to store 
the jupyterhub database.
```

##### ***`Wednesday, 27th July`***
```markdown
Planning to include a small documentation in the readme section.
This mini documentation will show how the internal structure of the scripts, 
highlighting the entire commands used along with the  config file.
```

##### ***`Tuesday, 26th July`***
```markdown
Rewriting the readme file with the necessary diagrams.The readme will guide us on how we 
move ahead and implement the project step by step.
```

##### ***`Monday, 25th July`***
```markdown
Moving the scripts from centOS to almaLINUX.Everything works fine except the docker script. 
Since Alma is a completely new distribution, the docker repo has not been updated.
```

##### ***`Friday, 22th July`***
```markdown
saving nginx for later use, moving back to configurable-http-proxy 
```


##### ***`Wednesday, 20th July`***
```markdown
Experimenting with a custom proxy deployment called nginx. 
```

##### ***`Tuesday, 19th July`***
```markdown
Finally came up with a minimal layout to explain everything.  
```

##### ***`Monday, 18th July`***
```markdown
Dumped the previous diagram created in draw.io, and again starting from the 
scratch with a better template. 
```


##### ***`Sunday, 17th July`***
```markdown
Using Draw.io to create the necessary diagrams, especially the network layout 
and the software work flow.
```

##### ***`Friday, 15th July`***
```markdown
Configuring the scripts for a new OS RHEL9.Most of the part works, except the docker part.
```

##### ***`Wednesday, 13th July`***
```markdown
Configuring the firewall for MultiWAN setup or what we popularly call load balancing.
In case one of the ISP fails or the monitoring IPs on the two gateway fails, 
the firewall will quickly switch to another one to the active one. 
```


##### ***`Tuesday, 12th July`***
```markdown
The firewall is up and running .Time to test some ipv4 rules, port forwarding,wlans 
VLANS,etc.Even this firewall can be used to check ports in use by different application. 
```


##### ***`Monday, 11th July`***
```markdown
Preparing to install a firewall called pfsense(enterprise grade firewall simillar to like cisco).
Also spent the whole day trying to configure the network drivers and adapters.
```

##### ***`Friday,8th July`***
```markdown
MHPC presentation on the project.
```
##### ***`Thursday,7th July`***
```markdown
Preparing presentation for MHPC.
```

##### ***`Monday,4th July`***
```markdown
Downloading, Installing and configuring CentOS,debian,ubuntu,Redhat, openwrt 
with necessary config file in the virtual environment.
```

##### ***`Sunday,3th July`***
```markdown
Working with virtual environment called hypervisor.One of the Intel NUC's will be flashed with the proxmox, 
which will in turn host several OS.
```

##### ***`27th - 1th July`***
```
Procuring and deployment of Intel mini computer (called NUC).This mini computer will be used to host 
the jupyterhub, like a server client model. 
```


##### ***`Thursday,23th June`***
```markdown
Configuring docker to work on custom image proxy_image.tar of configurable-http-proxy 
inside docker container.The image is configured to work with any random port available.
The proxy_server runs successfully inside the docker, 
but a curl request  for API_TOKEN does not work. 
```

##### ***`Wednesday, 22th June`***
```markdown
Working with the nodejs package manager npm to install http-configurable-proxy, 
returned with error.Since http-configurable-proxy is a python package we can repeat the 
installation in a virtual environment with "miniconda".The package is successfully installed,but 
jupyterhub fails to start, returns with some proxy error.
```

##### ***`Tuesday, 21th June`***
```markdown
The ansible script to install jupyterhub is ready.Successfully installed the hub using Redhat 8 on 
amazon cloud service.Since the aws comes with pre-configured DNS, only a small changes in the incoming 
traffic rule for http and https request 
is required for anyone to access the hub.  

```

##### ***`Monday, 20th June`***
```
Writing the first ansible script for debian based OS ubuntu.The playbook installs jupyter-dev version on 
hub using ansible builtin pip module, mentioned in the documentation. Also three more ways to install the 
hub like docker container,conda and script file has also been done.  

```


##### ***`Sunday,20th June`***
```
Playing around CentOS installation on master9, mostly revisiting the old config file for named dns dhcp...etc.
Installed timeshift to create a backup of default settings and configuration like a freshly prepared system, before 
scattering garbage all across the system.But, unfortunately the master10 did not survive a restore using timeshift.   
```

##### ***`6th - 10th June`***
```
The week is spent on the Intel guys teaching at MHPC 
```

##### ***`Saturday, 4th June`***
```
..........ssl-certificates,proxy-server..etc
..........
```

##### ***`Friday, 3rd June`***
```
..........microk8s on bare metal
..........
```

##### ***`Thursday, 2nd June`***
```
...........kubernetes + docker
...........
```


##### ***`Wednesday, 1st June`***
```
...........python script for hub
...........documentation...
```


