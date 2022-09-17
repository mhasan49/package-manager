Authenticator
===========================

The Authenticator is the mechanism for authorizing users to use the Hub and single user notebook servers.

LDAPapauthenticator
######################

Simple LDAP Authenticator Plugin for JupyterHub

**Installation**

- You can install it from pip with:
  
  .. code:: bash

     pip install jupyterhub-ldapauthenticator
     
...or using conda with:

.. code:: bash

   conda install -c conda-forge jupyterhub-ldapauthenticator














Native Authenticator
######################

This is a relatively simple authenticator for small or medium-sized JupyterHub applications. 
Signup and authentication are implemented as native to JupyterHub without relying on external services.

- Running tests

To run the tests locally, you can install the development dependencies like so:

.. code:: bash

   pip install -r dev-requirements.txt

Then run tests with pytest:

.. code:: bash

   pytest
