## =============================================================================== ##
## OCSINVENTORY-NG                                                                 ##
## Copyleft Antoine ROBIN 2021                                                     ##
## Web : http://www.ocsinventory-ng.org                                            ##
##                                                                                 ##
## This code is open source and may be copied and modified as long as the source   ##
## code is always made freely available.                                           ##
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt** ##
## =============================================================================== ##

$command = wmic product get name
$collection = $command -match "\s+|\n+"

for($i = 1; $i -lt $collection.Length; $i++){
    if(![string]::IsNullOrEmpty($collection[$i].Trim())){
        $xml = "<WMIPRODUCTLIST>`n"
        $xml += "<NAME>" + $collection[$i].Trim() + "</NAME>`n"
        $xml += "</WMIPRODUCTLIST>`n"
        [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
        [Console]::WriteLine($xml)
    }
}
