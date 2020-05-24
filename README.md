# Docker-
Install docker on windows server 2016

```
Install-Module DockerMsftProvider -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force



Install-Module -Name DockerMsftProvider -Force

Install-Package -Name docker -ProviderName DockerMsftProvider


-----------------------
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
3 - Run:

Install-PackageProvider -Name NuGet


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Install-Module -Name DockerMsftProvider -Force
Install-Package -Name docker -ProviderName DockerMsftProvider -Force
Restart-Computer -Force

(Install-WindowsFeature Containers).RestartNeeded

https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/deploy-containers-on-server

docker pull mcr.microsoft.com/windows/servercore:1607
docker pull mcr.microsoft.com/windows/nanoserver:1803


Enable-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V –All -NoRestart
Install-WindowsFeature RSAT-Hyper-V-Tools -IncludeAllSubFeature

https://andreigaspar.com/running-linux-containers-on-windows-server/

[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
Restart-Service Docker
-------------------------+++++++++++++
C:\ProgramData\docker\config\daemon.json  does not exist then "stop-service docker" and run the below command

.\dockerd.exe -D --experimental
+++++++++++++++++++++++++++++++++++++++
To switch to Linux Containers

PowerShell

		[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
Restart-Service docker


To switch back to Windows Containers

		[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", $null, "Machine")
Restart-Service docker

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Install-Package -Name docker -ProviderName DockerMsftProvider -Force -RequiredVersion 18.03

Update-Module DockerMsftProvider

Install-WindowsFeature Containers

Enable-WindowsOptionalFeature -Online -FeatureName containers -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
------------------------------
Uninstall-Package -Name docker -ProviderName DockerMsftProvider
Uninstall-Module -Name DockerMsftProvider

Get-HNSNetwork | Remove-HNSNetwork

Remove-Item "C:\ProgramData\Docker" -Recurse

Remove-WindowsFeature Containers
Remove-WindowsFeature Hyper-V

Restart-Computer -Force


```
