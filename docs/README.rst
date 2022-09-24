JupyterHub
==========

**Configuration Basics** 

1. The default configuration file, ``jupyterhub_config.py`` contains comments and 
guidance for all configuration variables and their default values, will remain in it's custom 
location ``/config/default/jupyterhub_config.py`` along with other custom script we write.
   
2. Proxy Settings - The Hub service listens only on localhost (port 8081) by default, but can be 
changed to any port of our requirement. The Hub needs to be accessible from both the proxy and all 
Spawners.If either the Proxy or (more likely) the Spawners will be remote or isolated in containers, 
the Hub must listen on an IP that is accessible.We, will be using ``configurable-http-proxy``. 
The configurable proxy runs two HTTP(S) servers:The public-facing interface to your application 
(controlled by --ip, --port) listens on all interfaces by default.The inward-facing REST API 
(--api-ip, --api-port) listens on localhost by default.The REST API uses token authorization, 
where the token is set in the CONFIGPROXY_AUTH_TOKEN environment variable.
   
3. Cookie secret -

4. SSL encryption - It is also possible to use ``letsencrypt`` to obtain a free, 
5. trusted SSL certificate.In that case we need a proper domain name.

6. Network Settings - Configure the Hub if the Proxy or Spawners are remote or isolated.

**Authenticator** 

1. For testing purpose - JupyterHub ships with the default PAM-based Authenticator, for logging 
in with local user accounts via a username and password. `Dummy Authenticator` used for testing 
purpose, but will be later removed by a custom Authenticator.

4. Users - A list of valid users will be constructed, based on temple's requirements. 
  
5. OAuth - ``OAuth`` is a token based login mechanism that doesn't rely on a username and password mapping. 
 In order to use this login mechanism with JupyerHub the login handlers need to be overridden. OAuthenticator 
overrides these handlers for the common OAuth2 identity providers allowing them to be plugged in and used with 
JupyterHub.
  
2. `Github` or ``Google`` account will be configured with OAuth

**Spawner** 

1. A Spawner starts each single-user notebook server. The Spawner represents an abstract interface to a process, and a custom 
2. Spawnerwill be implemented.

3. For testing - The ``dockerspawner`` (also known as JupyterHub Docker Spawner), enables JupyterHub to spawn single user notebook 
4. servers in Docker containers will be used.It takes an authenticated user and spawns a notebook server in a Docker container for the user.

5. Spawner options form - 
   
6. Spawners, resource limits, and guarantee -
  
 **Database**
 1. JupyterHub brings the power of notebooks to groups of users. It gives users access to computational environments and resources without burdening the users with installation and maintenance tasks. Users - including students, 

Also, it will comes equipped with ``Monitoring``,``Telemetry``,``REST API``

**External services** 

1. Service is defined as a process that interacts with the Hub’s REST API.
  
2. ``jupyterhub-idle-culler`` provides a JupyterHub service to identify and shut down idle or long-running Jupyter Notebook servers.
  
3. systemd to manage a JupyterHub Service 


*Prerequisites*

Before installing JupyterHub, you will need a Linux/Unix based system.`Python 3.6` or greater. An understanding of using ``pip`` or ``conda`` 
for installing Python packages is helpful.

*Installation*  

1. Clone the repo
   
.. code-block:: bash

    git clone https://github.com/mhasan49/jhub_temple.git
   
1. Configure the default ansible files by

.. code-block:: bash
  
    make config
   
3. Install jupyterhub packages

.. code-block:: bash

    make install_jupyterhub
   
4. Installing docker and associated features

.. code-block:: bash
   
    make docker
   
5. Once successfully installed, we can start the hub by first activating the venv

.. code-block:: bash

    source /path/to/jupyterhub/venv/bin/activate

6. Finally, to start the hub

.. code-block:: bash
    
    jupyterhub -f /path/to/jupyterhub_config.py
     
Contents
--------

**User Guide**

* :doc:`quickstart`
* :doc:`proxyserver`
* :doc:`authenticator`

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: User Guide

   pages/quickstart
   pages/proxyserver
   pages/authenticator
   

   
