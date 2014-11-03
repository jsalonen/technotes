# Chef

## Key concepts

Knife: a command-line tool that provides an interface between a local chef-repo and the server (<http://docs.opscode.com/knife.html>).

## Some usage patterns

### List all nodes on a Chef server

    knife node list

### Update a cookbook on a Chef server

    knife cookbook upload mycookbook

### Update environment

    knife environment from file dev.rb

### Update role

    knife role from file app1.rb

### Update data bag

Update data bag from folder `artifacts`

    knife data bag from file artifacts app1.json

### Show node information (like IP)

    knife node show mynode1
    
### Search nodes by criteria

    knife search node "chef_environment:development AND tags:mynodegroup"
