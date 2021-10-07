# Azure subscription vars
subscription_id = "086b84c2-b58a-4315-94c9-4bb08f54e9f5"
client_id       = "8cff2209-696b-40e3-9512-69955eab5df6"
client_secret   = "byjdR39-MSjxf300BbP.wCtFfPG6re9Sxk"
tenant_id       = "a7e5856d-4c1e-40e8-a257-550aa3e8f15c"

# Resource Group/Location
location         = "eastus2"
resource_group   = "RG-ud-az-qlty"
application_type = "qlty-test-app"

# Network
virtual_network_name = "vn-ud-az-qlty"
address_space        = ["10.5.0.0/16"]
address_prefix_test  = "10.5.1.0/24"

# VM
packer_image   = "/subscriptions/086b84c2-b58a-4315-94c9-4bb08f54e9f5/resourceGroups/RG-myPackerImage/providers/Microsoft.Compute/images/azQltyPrjImage"
admin_username = "narain2992"

# public key in azure pipelines
# public_key_path = "/home/vsts/work/_temp/myKey.pub"

# public key on Windows local machine
  public_key_path = "~/.ssh/id_rsa"