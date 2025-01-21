
#!/bin/bash

server_address=()
server_password=()
count=0

# reading the server_inf oand creating server_address out of it
read_server_info(){
    local  server_path=$1
    server_data=$(awk '{ print $1 }' "$server_path")

    for i in $server_data; do #!/bin/bash
       server_address+=($i)
       ((count+=1))
       done

}

# reading the password and creating a password array out of it
read_passwords(){
    local password_path=$1
    password=$(awk '{ print $2 }' "$password_path")

    for i in $password; do
    server_password+=($i)
    done

    # echo ${server_password[@]}
}


key_generation(){
    echo "P00kharelk#" |  sudo -S ssh-keygen -t rsa -N ""
    echo "key generated"
}


# making the copy of a key in the remote server
copying_key_to_remote_server(){
    for ((k=0;k<$count;k++)); do
           echo ${server_password[$k]}
           echo ${server_address[$k]}
     sshpass -p ${server_password[$k]} ssh-copy-id -i ~/.ssh/id_rsa.pub ${server_address[$k]}
    done
}


# reading a server_information
read_server_info file.txt

# reading the password information
read_passwords file.txt


# ssh key is there or not if not then generate the key
if !   test -f ~/.ssh/id_rsa; then
   echo "generating a key"
  key_generation
fi


copying_key_to_remote_server




