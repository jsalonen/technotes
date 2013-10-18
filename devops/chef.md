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
