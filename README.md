# docker-rxUpdater  
Because the normal renegade-x launcher should no longer work using wine, and the new launcher is still in the works, this docker image can be quickly used to update the game.  
However, not every distro has libc 2.32 in their stable branch yet (looks at Debian). This method quickly circumvents that by making an image that has a more recent version, and comes with the update tool from Sonny.   
<br>
The docker image uses an older version of @SonnyX's [patcher-lib](https://github.com/SonnyX/RenegadeX-patcher-lib)  to update the game.  
<br>
# Usage  
Note:  
The image is built with running the wine prefix as [a seperate wine user](https://wiki.archlinux.org/title/Wine#Running_Wine_under_a_separate_user_account) in mind (security reasons), either add permissions for userid "1010" or temporarly allow others to Read Write Execute.  
A) ``setfacl -R -m u:1010:rwx <path/to/Renegade X>``  
B) ``chmod -R o+rwx <path/to/Renegade X>`` (don't forget to remove it later!)

- Build the image:
  - ``docker build . -t rxpatcher``  
- Run the container:
  - ``docker run -it -v "/Path/To/Renegade X/":/mounted_volume rxpatcher:latest``    
<br>  

Upon executing the above commands, it should list a DNS error followed by either: Game update available! or Game is up to date!  
In the first case, it'll silently download the update and will notify you when its done, the container will then stop.  

<br>

Special thanks to [SonnyX](https://github.com/SonnyX)  