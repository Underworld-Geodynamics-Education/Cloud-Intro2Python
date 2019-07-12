## Nectar cloud

Add yourself to the docker group (create if necessary)

https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user

Using a lot of space for the images ... may need to move the docker image location to a bigger disk

https://linuxconfig.org/how-to-move-docker-s-default-var-lib-docker-to-another-directory-on-ubuntu-debian-linux




### Instances / machines


### What to do ...


  3. Log into the container-optimised virtual machine on google
    - `docker pull` the required image
    - `mkdir vieps_data`
    - `mkdir vieps_users`
    - `chmod a+w` on these (maybe `chown chronos vieps_data` ?)

  4. Run the container with the following command:

     (Note the paths !)

```sh
nohup docker run --cpus=4 --name vieps-pye -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 8084:8084 -p 8085:8085 -p 8086:8086 -p 8087:8087 -p 8088:8088 -p 8089:8089 -p 8090:8090 -p 8091:8091 -p 8092:8092  -v /home/lmoresi/vieps_data:/home/jovyan/Data/Resources -v /home/lmoresi/vieps_users:/home/jovyan/build lmoresi/docker-vieps-pye-8user:2018.1 &
```
  5. exit the shell using `^D` to ensure that the process continues to run in the background

  6. Log into the root instance of the site (`http:?.?.?.?:8080`) and use the `jupyter` terminal to rebuild the site (the external directories will have been overlain by mounting the persistent volumes). Back up this data if the image has been in use before.

  7. Do any other site maintenance / preparation such as caching data via the root instance. This will change the master copies of notebooks and can be propagated out via the `scripts/run-sitebuilder8.py` command.

#### Notes on these instructions

Volumes exposed in the image are:

``` sh
  /home/jovyan/Data/Resources
  /home/jovyan/build
```
We need to use absolute paths in the `docker run` command
otherwise these things get created quietly somewhere in the `/var/docker` area.
That might be OK as it would be persistent, but not helpful for backup etc.

### Usage

The root instance is the user logging in via the 8080 port

#### Passwords

Pretty obvious, but can be changed in the run-jupyter scripts.
