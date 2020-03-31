# docker-tooling
Misc tools that can be in your $PATH to make life easier

checkout this project wherever you like then simply add the following line to your .bashrc, .zshrc or whichever shell you use.

```
PATH=$PATH:$HOME/docker-tooling/
```

naturally update the path to match the location of your checkout.

  * docker_image_cleanup.sh Will stop all running containers and remove all containers, all volumes and all networks.
  * docker_enter.sh <argument> will try to find a container matching the argument name and enter the running container
  * docker_reset_instance.sh Will remove all state and reset the container back to the original version based on the image.

K8 Tooling: 
  * k8_enter.sh allows you to enter a bash shell of a running pod assuming the name is unique 

ie. A database container once reset will revert back to the original data that came with the image.  (Assuming no external volumes are used)

