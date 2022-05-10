<?php
## =============================================================================== ##
## OCSINVENTORY-NG                                                                 ##
## Copyleft Antoine ROBIN 2021                                                     ##
## Web : http://www.ocsinventory-ng.org                                            ##
##                                                                                 ##
## This code is open source and may be copied and modified as long as the source   ##
## code is always made freely available.                                           ##
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt** ##
## =============================================================================== ##

function extension_install_wmiproductlist()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery(
        "CREATE TABLE `wmiproductlist` (
        `ID` BIGINT NOT NULL AUTO_INCREMENT, 
        `HARDWARE_ID` INTEGER NOT NULL,
        `NAME` VARCHAR(255) DEFAULT NULL,
        `VENDOR` VARCHAR(255) DEFAULT NULL,
        `VERSION` VARCHAR(255) DEFAULT NULL,
        `INSTALLSTATE` VARCHAR(255) DEFAULT NULL,
        `INSTALLDATE` VARCHAR(255) DEFAULT NULL,
        `IDENTIFNUM` VARCHAR(255) DEFAULT NULL,
        `HELPLINK` VARCHAR(255) DEFAULT NULL,
        `INSTALLSOURCE` VARCHAR(255) DEFAULT NULL,
        PRIMARY KEY (ID,HARDWARE_ID)) ENGINE=INNODB;"
    );
}

function extension_delete_wmiproductlist()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `wmiproductlist`");
}

function extension_upgrade_wmiproductlist()
{

}

?>