# What's that?
Very simple terraform project, that creates compute instance 
with Blender software installed. Yandex Cloud is used as a service provider.
Primary use case - fast deployment and destruction of temporary instances 
used for scene/animation server-side render in Blender.

# Guide
First of all go to `terraform` directory and initialize terraform:
```bash
cd ./terraform
terraform init
```

Next, apply terraform configuration using your `YC_TOKEN`:
```bash
YC_TOKEN=$(yc iam create-token) terrafrom apply -var="folder_id=${FOLDER_ID}"
```

> **Caution!**
> By default `id_rsa` and `id_rsa.pub` from your ~/.ssh are used to configure ssh access to instance and run provision scripts. 
> You can override paths with `ssh_public_key_path` and `ssh_private_key_path` variables.

After successful completion of the command, you will see running compute instance in your cloud folder.
Public ipv4 is attached and available as terraform output. Now you can connect to the instance via ssh. 
Let's upload our Blender files now:
```bash
INSTANCE_IP=$(terraform output -raw blender_render_ip)
scp ~/masterpiece.blend ubuntu@${INSTANCE_IP}:~/
```

Do not forget to pack external resources into blend file. Those of resources that cannot be packed must
be uploaded alongside your .blend file (use relative paths while saving to make your life easier).

Now we are ready to start render process. Connect to the instance via ssh and run blender command:
```bash
ssh ubuntu@${INSTANCE_IP}
blender -b ~/masterpiece.blend -a -t 12
```
> Blender will use render settings saved in your blend file.
