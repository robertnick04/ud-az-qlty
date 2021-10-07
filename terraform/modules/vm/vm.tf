resource "azurerm_network_interface" "test" {
  name                = "udacity-project-3-NIC"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group
  size                  = "Standard_B2s"
  admin_username        = var.admin_username
  source_image_id       = var.packer_image
  disable_password_authentication = true

  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = var.admin_username
    #public_key = file(var.public_key_path)
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiEGN0fk7U5gYdqj1b1ijYG1483bhXVyIaZb90Vo/waX1OtvjV3Mc0lPfeOD9HFkhhcMSFzzEEBucFhhnhWP7IQES6+59JmLbklRtnY492sPURYunkHWaSJDGa4uwiFmxIcHTxBvAmVBOHJgs5RLqiSLDBAu6Q/dJYu85ykiPPlXByvbeZyAVuq6UdbOlWeVbB8NEjw1i63hDkT4etqOeOFM5Eq5wnamFGrOLpE9CRX6uzg7j1GN7T0DHu1PGPCbJMO8Lvg+byLn6evra1YH9VA7w3JBvwCU4/kUos7k0bauecA+ihvtZtpM8/EYa9D6eRZg4KGd3k5JnFFWRV4ZdNmG9JGZrNVcRXduJ6tmt+9sB1sKhLGC1sY6WFyYRdy6qgsVV808r8cqpvuFodBhb291AbJ3inQyIIVWPZ4xw7ZtKP14EqMuFoQXhz7VMda+nYVDYOAQPfGlswwZ3BuXhGtpFSLkN6NwPVW+S3EWD8kLE2Zb+5Z7XqnkoqVGRBVkM="
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
#  source_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "18.04-LTS"
#    version   = "latest"
  tags = {
    project_name = "QA"
    stage        = "Testing"
  }
}
