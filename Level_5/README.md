# Level 5
Captain cargo wants to test your networking skills for which he wants you to create some containers and assign them to a particular network.

***NOTE***: 
- ***USE ALPINE AS A BASE IMAGE TO CREATE IMAGES AND MAKE SURE THEY ARE CORRECTLY NAMED WHILE RUNNING***
- ***RUN THE 'flag' EXECUTABLE TO GET THE FLAG***


## TASK

**Create Containers Named**: server1, bridge_server, server2

**Create Networks Named**: network1, my_bridge, network2

**network1**: server1 

**my_bridge**: server1, bridge_server, server2

**network2**: server2

## Hint


**Topics Required**: Basics, Networking

**Commands Used**: 

-
        docker network create <NETWORK_NAME>
-
        docker run -d --name <CONTAINER_NAME> --network <NETWORK_NAME> alpine sleep infinity
