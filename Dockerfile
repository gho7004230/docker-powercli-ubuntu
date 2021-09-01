FROM gho7004230/powershell:ubuntu

SHELL ["/usr/bin/pwsh", "-c"]

RUN Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"
RUN Find-Module "VMware.PowerCLI" | Install-Module -Scope "AllUsers" -AllowClobber
RUN Get-Module "VMware.PowerCLI" -ListAvailable | FT -Autosize
RUN Get-Module "VMware.*" -ListAvailable | FT -Autosize
RUN Update-Module "VMware.PowerCLI"

ENTRYPOINT ["pwsh","-c"]
