## =============================================================================== ##
## OCSINVENTORY-NG                                                                 ##
## Copyleft Antoine ROBIN 2021                                                     ## 
## Copyleft Charlene AUGER 2022                                                    ##
## Web : http://www.ocsinventory-ng.org                                            ##
##                                                                                 ##
## This code is open source and may be copied and modified as long as the source   ##
## code is always made freely available.                                           ##
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt** ##
## =============================================================================== ##

$InstallState = @{
    Name = 'InstallState'
    Expression = {
        # property is an array, so process all values
        $value = $_.InstallState
        switch([int]$value)
        {
            -6      {'Bad Configuration'}
            -2      {'Invalid Argument'}
            -1      {'Unknown Package'}
            1       {'Advertised'}
            2       {'Absent'}
            5       {'Installed'}
            default {"$value"}
        }
    }  
}

$InstallDate = @{
    Name = 'InstallDate'
    Expression = {
        $_.InstallDate.Insert(4,'-').Insert(7,'-')
    }
}

$wmicObjects = Get-WmiObject Win32_product | Select-Object Name, Vendor, Version, $InstallState, $InstallDate, IdentifyingNumber, HelpLink, InstallSource
$xml = ""

foreach ($wmicObject in $wmicObjects) {
    if($wmicObject.Name) {
        $xml += "<WMIPRODUCTLIST>`n"
        $xml += "<NAME>"+ $wmicObject.Name +"</NAME>`n"
        $xml += "<VENDOR>"+ $wmicObject.Vendor +"</VENDOR>`n"
        $xml += "<VERSION>"+ $wmicObject.Version +"</VERSION>`n"
        $xml += "<INSTALLSTATE>"+ $wmicObject.InstallState +"</INSTALLSTATE>`n"
        $xml += "<INSTALLDATE>"+ $wmicObject.InstallDate +"</INSTALLDATE>`n"
        $xml += "<IDENTIFNUM>"+ $wmicObject.IdentifyingNumber +"</IDENTIFNUM>`n"
        $xml += "<HELPLINK>"+ $wmicObject.HelpLink +"</HELPLINK>`n"
        $xml += "<INSTALLSOURCE>"+ $wmicObject.InstallSource +"</INSTALLSOURCE>`n"
        $xml += "</WMIPRODUCTLIST>`n"
    }
}

if($xml -eq "") {
    $xml += "<WMIPRODUCTLIST/>`n"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::WriteLine($xml)