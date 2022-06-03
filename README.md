# wardenscripts

## Install

- You must first install warden
- Create a directory
- Copy the installmagento python script to this directory
- Copy the installmagento.sh script to the ~/.warden

## Pre use

- Warden will use you .composer/auth.json so put your marketplace credential
- the warden container must be running, so run **warden svc up**

## Create a new magento2 container

- go the created directory that contain the installmagento python scrip
- run **./installmagento --domain=yourdomain --magento-version=2.4.4** (you can use any version of magento2)
- go to the directory **yourdomain**
- on this directory run **warden shell**
- after this command you are on an ssh in your magento container
- on this ssh run **./installmagento.sh** this will install your magento with sample data
- once the script ends, you can open your broswer and point to **https://app.yourdomain.test**
- the admin url is **https://app.yourdomain.test/demoadmin** and the user/pass is **admin/q1w2e3r4**

## Manage your magento container

- to start your container, go the directory of your domain and run **warden env up**
- to stop your container, go the directory of your domain and run **warden env stop**
- to end and delete your container, go the directory of your domain and run **warden env down -v**


