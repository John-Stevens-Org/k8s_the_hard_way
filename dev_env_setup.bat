rem setup chocolatey
Set-ExecutionPolicy AllSigned -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

rem install stuff
cinst chocolateygui git vscode vagrant virtualbox

rem install vscode extensions
code --install-extension alefragnani.project-manager & code --install-extension BroadcomMFD.cobol-language-support & code --install-extension DotJoshJohnson.xml & code --install-extension esbenp.prettier-vscode & code --install-extension GitHub.github-vscode-theme & code --install-extension GitHub.remotehub & code --install-extension marcostazi.VS-code-vagrantfile & code --install-extension ms-azuretools.vscode-docker & code --install-extension ms-python.python & code --install-extension ms-python.vscode-pylance & code --install-extension ms-toolsai.jupyter & code --install-extension ms-toolsai.jupyter-keymap & code --install-extension ms-toolsai.jupyter-renderers & code --install-extension ms-vscode-remote.remote-wsl & code --install-extension ms-vscode.remote-repositories & code --install-extension redhat.ansible & code --install-extension redhat.java & code --install-extension redhat.vscode-yaml & code --install-extension samuelcolvin.jinjahtml & code --install-extension VisualStudioExptTeam.vscodeintellicode & code --install-extension vscjava.vscode-maven & code --install-extension vscode-icons-team.vscode-icons & code --install-extension wayou.vscode-todo-highlight & code --install-extension wholroyd.jinja & code --install-extension yzhang.markdown-all-in-one

