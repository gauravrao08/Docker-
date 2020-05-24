# Docker-
Install docker on windows server 2016

```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet
or #for particluar version of NuGet
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
```

```
Install-WindowsFeature Hyper-V
Enable-WindowsOptionalFeature
or

Enable-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V –All -NoRestart

or 
Install-WindowsFeature RSAT-Hyper-V-Tools -IncludeAllSubFeature
```

```
Install-WindowsFeature Containers
Enable-WindowsOptionalFeature
or

Enable-WindowsOptionalFeature -Online -FeatureName containers -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

```
Install-Module DockerMsftProvider -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force

or 
Install-Module -Name DockerMsftProvider -Force
Install-Package -Name docker -ProviderName DockerMsftProvider

or ## for particular version  of docker
Install-Package -Name docker -ProviderName DockerMsftProvider -Force -RequiredVersion 18.03

```

```
Update-Module DockerMsftProvider
```
sconfig

```
#to check restarted is needed or not
(Install-WindowsFeature Containers).RestartNeeded
```
```
#restart system
Restart-Computer -Force
``

```
docker pull mcr.microsoft.com/windows/servercore:1607
docker pull mcr.microsoft.com/windows/nanoserver:1803
```

```
#To switch to Linux Containers

[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
Restart-Service docker


#To switch back to Windows Containers
[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", $null, "Machine")
Restart-Service docker
```

```
# to enable experimental to "true"
C:\ProgramData\docker\config\daemon.json  #if does not exist then "stop-service docker" and run the below command


.\dockerd.exe -D --experimental
```
