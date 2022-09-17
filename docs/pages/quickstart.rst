Quickstart - Installation
===========================
**Prerequisites**

*Before installing JupyterHub and the Makefile file to work *, you will need:

- `Alma Linux <https://almalinux.org/>`_ 8.6 or greater
   
  A fresh installation of this distribution.Inside the the folder `auto_deploy_RHEL`, the script has been customized to work with the Alma Linux 8.6. 
  and few other distribution of the same family, like `CentOS 7.6 <https://www.centos.org//>`_, 
  `RHEL <https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux/>`_, and others. 
   
- `Ansible <https://www.ansible.com/>`_ xx.x or greater

- `Python <https://www.python.org/downloads/>`_ 3.3 or greater

  An understanding of using `pip <https://pip.pypa.io/en/stable/>`_ or
  `conda <http://conda.pydata.org/docs/get-started.html>`_ for
  installing Python packages is helpful.

- `nodejs/npm <https://www.npmjs.com/>`_

  `Install nodejs/npm <https://docs.npmjs.com/getting-started/installing-node>`_,
  using your operating system's package manager. For example, install on Linux
  (Debian/Ubuntu) using:

- The ``nodejs-legacy`` package installs the ``node`` executable and is currently required for npm to work on Debian/Ubuntu.

- Apart from the above mentioned requirements, we also have to install the following packages:
   ``make`` , ``curl``, ``git``


Auto-Installation
#############

One command to install all the required packages and jupyterhub, we will issue:

.. code-block:: bash

    make all

This command will first update the system with all the necessary packages, 
and then install jupyterhub. 

Step-by-Step Installation
#############

1. In this method we will first update the linux system, 

.. code-block:: bash

    make software

which will install ``epel-release``, ``ansible`` and ``python`` will be installed.

2. Next we will install the proxy server, by:

.. code-block:: bash

    make install_proxy

3. The command will first install ``configurable-http-proxy``, and then it will run a 
test to confirm its status.

.. code-block:: bash

    make install_requirements    

The above command will first create a virtual environment and install all it's dependencies 
mentioned in the ``dev-requirements.txt`` and ``requirements.txt`` in the virtual environment 
The location of the virtual environment will be path 
``/path/tojupyterhub/jupyterhub/venv``:

4. Next we will install the LDAP Authenticatior. After the installation it will also run a pytest
   to confirm its status.

.. code-block:: bash
    
    make install_authenticator 

5. Next we will install Spawner. 
   
.. code-block:: bash
    
    make install_spawner




Start the Hub server
####################

To start the Hub server, first activate the `virtual environment` by the command:

 .. code-block:: bash
   
   source /path/to/jupyterhub/venv/bin/activate

If you are using fish shell, use ``activate.fish`` instead. Then start the 
Hub server by the command:

  .. code-block:: bash
    
    jupyterhub -f /path/to/jupyterhub/testing/jupyterhub_config.py
  
or you may also use ``jupyterhub`` just as a command to test the hub. For more 
information use ``jupyterhub -help``. 

Visit https://localhost:8000 in your browser, and sign in with your unique credentials.

To allow multiple users to sign into the Hub server, 
you must start `jupyterhub` as a *privileged user*, such as root:

 .. code-block:: bash

   sudo jupyterhub

The `wiki <https://github.com/jupyterhub/jupyterhubwiki>`_ 
Using-sudo-to-run-JupyterHub-without-root-privileges describes how to 
run the server as a *less privileged user*, which requires additional configuration of the system.


Optional Configuration
#####################

The `Jupyterhub Documentation <https://jupyterhub.readthedocs.io/en/stable/>`_ contains
detailed information about configuring a JupyterHub deployment.

Generate a default configuration file

Generate a default config file:
 .. code-block:: bash

    jupyterhub --generate-config

**Customize the configuration, authentication, and process spawning**

Spawn the server on ``10.0.1.2:443`` with **https**:
 .. code-block:: bash

    jupyterhub --ip 10.0.1.2 --port 443 --ssl-key my_ssl.key --ssl-cert my_ssl.cert

The authentication and process spawning mechanisms can be replaced,
which should allow plugging into a variety of authentication or process
control environments. Some examples, meant as illustration and testing of this
concept, are:

- Using GitHub OAuth instead of PAM with `OAuthenticator <https://github.com/jupyterhub/oauthenticator>`_
- Spawning single-user servers with Docker, using the `DockerSpawner <https://github.com/jupyterhub/dockerspawner>`_

----

Alternate Installation using Docker

A ready to go `docker image for JupyterHub <https://hub.docker.com/r/jupyterhub/jupyterhub/>`_
gives a straightforward deployment of JupyterHub.

