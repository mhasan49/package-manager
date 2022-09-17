Proxy-Server
===========================

It is a simple wrapper around node-http-proxy. node-http-proxy is an HTTP programmable proxying library
that supports websockets and is suitable for implementing components such as reverse 
proxies and load balancers. 

Manual Installation
####################

``Prerequisite: Node.js ≥ 10``

If you're installing configurable-http-proxy in Linux, you can follow the instruction of 
nodesource to install arbitrary version of Node.js.

To install the configurable-http-proxy package globally using npm:

.. code:: bash
    
     npm install configurable-http-proxy -g

To install from the source code found in this GitHub repo:

.. code:: bash

     git clone https://github.com/jupyterhub/configurable-http-proxy

     cd configurable-http-proxy
     
     npm install  # Use 'npm install -g' for global install



Auto Installation
####################

In order to install via ansible script , we will use:

.. code:: bash
    
    make install_proxyserver


Jupyterhub Configuration
####################

.. code:: yaml

     c.JupyterHub.proxy_api_ip = '
     c.JupyterHub.proxy_api_port = '
     c.JupyterHub.proxy_api_prefix = '
     c.JupyterHub.proxy_auth_token = '
     c.JupyterHub.proxy_auth_prefix = '
     c.JupyterHub.proxy_public_api_ip = '
     c.JupyterHub.proxy_public_api_port = '
     c.JupyterHub.proxy_public_api_prefix = '
     c.JupyterHub.proxy_public_auth_token = '
     c.JupyterHub.proxy_public_auth_prefix = '
     c.JupyterHub.proxy_public_url = '
     c.JupyterHub.proxy_url = '
     c.JupyterHub.proxy_api_token = '
     c.JupyterHub.proxy_api_url = '
     c.JupyterHub.proxy_api_allow_credentials = '
     c.JupyterHub.proxy_api_allow_headers = '
     c.JupyterHub.proxy_api_allow_methods = '
     c.JupyterHub.proxy_api_allow_origin = '
     c.JupyterHub.proxy_api_max_body_size = '
     c.JupyterHub.proxy_api_max_concurrent_requests = '
     c.JupyterHub.proxy_api_max_request_size = '
     c.JupyterHub.proxy_api_max_requests = '
     c.JupyterHub.proxy_api_timeout = '
     c.JupyterHub.proxy_api_trust_user_provided_headers = '
  

Usage 
####################

.. code:: bash 
        
        proxy-server start

        configurable-http-proxy --default-target=http://localhost:8888

        curl -H "Authorization: token $CONFIGPROXY_AUTH_TOKEN" http://localhost:8001/api/routes


For more information on configurable-http-proxy, see the official documentation:
`configurable-http-proxy <https://github.com/jupyterhub/configurable-http-proxy>`_