# SSH-Accessible Ubuntu Docker Container

This README provides instructions on how to set up an Ubuntu Docker container that can be accessed via SSH. This setup is useful for creating a consistent development environment or testing purposes.

## Prerequisites

- Docker installed on your machine
- Basic understanding of Docker commands and SSH configurations

## Setup

### Building the Docker Container

1. Clone this repository to your local machine:
    ```bash
    git clone
    ```
2. Navigate to the cloned repository:
    ```bash
    cd ssh-ubuntu
    ```
3. Build the Docker image with the following command:
    ```bash
    docker build -t ssh-ubuntu .
    ```

### Running the Docker Container

1. Run the Docker container in detached mode and map port 8222 on your host to port 22 in the container:
    ```bash
    docker run -d --name workspace -p 8222:22 ssh-ubuntu
    ```

### Accessing the Container

1. Modify your SSH configuration to facilitate easy access. Edit (or create if it does not exist) the `~/.ssh/config` file:
    ```bash
    winpty docker exec -it workspace bash
    vi ~/.ssh/config
    ```

2. Add the following configuration to `~/.ssh/config`:
    ```config
    Host workspace
        HostName localhost
        User ubuntu
        Port 8222
    ```

3. You can now SSH into your Docker container using:
    ```bash
    ssh workspace
    ```

    When prompted for a password, enter `ubuntu`.

## Setting Up Visual Studio Code for SSH Access

Visual Studio Code (VS Code) can be configured to access the Docker container using the Remote - SSH extension. This allows you to edit code, run commands, and debug applications directly within the VS Code interface.

### Installing the Remote - SSH Extension

1. Open VS Code.
2. Go to the Extensions view by clicking on the square icon on the sidebar or pressing `Ctrl+Shift+X`.
3. Search for "Remote - SSH" in the extensions marketplace.
4. Click on the install button next to the Remote - SSH extension by Microsoft.

### Connecting to the Docker Container Using VS Code

1. After installing the extension, open the Command Palette by pressing `Ctrl+Shift+P`.
2. Type `Remote-SSH: Connect to Host...` and press Enter.
3. Select `workspace` from the list of configured SSH hosts, as defined in your `~/.ssh/config` file.
4. VS Code will initiate a connection to the Docker container. If prompted, enter the password `ubuntu`.

### Working in the Container

Once connected, VS Code will allow you to:
- Browse and edit files within the Ubuntu container.
- Open terminal sessions within the container directly from VS Code.
- Install additional VS Code extensions inside the container for development needs.

### Further Resources

For more detailed information and troubleshooting, visit the official Visual Studio Code documentation on Remote Development using SSH:
[VS Code SSH Tutorial](https://code.visualstudio.com/docs/remote/ssh-tutorial)


## Usage

Once you have set up your container and SSH connection, you can use this environment for development or testing. Customize the Dockerfile and configuration as needed for your specific requirements.

## Note

Ensure that Docker is correctly installed and configured on your machine. Adjust the port numbers and user configuration as necessary based on your specific environment and security requirements.
