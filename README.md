# OX Base Template Server
This repo is an updated version of Judd's ox_base_template_server, as he discontinued his repo I will still be contributing to this one for everyone. This repo contains resources for a "base" ESX server utilizing oxmysql, ox_inventory, NPWD, es_extended (ox version), esx_multicharacter (ox supported version) as well as many other "base" resources to get you started.

```diff
- THIS IS NOT A FULL SERVER! Only a base to get you started.
+ This repo may NOT get updated often, so if you want certain updates you will need to do so yourself.
```

With that being said, right out the gate everything will be working/usable but of course you will need to adjust some configs that will be tailored to your needs.

## Main Resources
* [ox_inventory](https://github.com/overextended/ox_inventory)
* [es_extended](https://github.com/overextended/es_extended)
* [esx_multicharacter](https://github.com/thelindat/esx_multicharacter)
* [NPWD](https://github.com/project-error/npwd)
* [fivem-appearance](https://github.com/ZiggyJoJo/brp-fivem-appearance)
* [dx_hud](https://github.com/0xDEMXN/dx_hud)

### Extras
* [qidentification](https://github.com/katotekii/qidentification) - qidentification has been setup to tie weapon/driver's license item to actual license required by weaponshop for example.
* [mdt](https://github.com/thelindat/mdt) - thelindat fork of hypaste's mdt
* [linden_outlawalert](https://github.com/thelindat/linden_outlawalert) - Per Linden this is broken/needs to be redone (take it or leave it but it does work in some basic scenarios)
* [luke_garages](https://github.com/LukeWasTakenn/luke_garages)
* **norp-vehicles** - resource with 1 addon car to show setup for 1 resource for multiple vehicles.
* A few other various resources and tweaks done by (Judd#7644) & Me (Fleevo#0001)

## Important Information
**Make sure to replace the "replaceme" text in server.cfg with your proper information!**

To use photos for NPWD you need to follow the installation guide here - https://projecterror.dev/docs/npwd/start/installation#setting-up-camera-functionality 

You can also just run FXServer.exe and during setup choose like CFX Default template and after setup
just delete resources created from setup and replace with the resources folder provided.

Similar with the server.cfg you get from setup or just copy and paste from the provided server.cfg

Make sure to change `oxtemplate` in the sql file before importing to your db name:
CREATE DATABASE IF NOT EXISTS `oxtemplate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `oxtemplate`;

## Support
I will not be providing direct support for this. I will keep it updated when I can but if you struggle using this then you will struggle with more and you will need to figure out things for yourself. Use google, check cfx forums, ask in discords, etc...
