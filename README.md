# velocity-javaxeagler

## Quick Links

- [Blueprints (Info)](#blueprints)
- [Blueprints (Guide)](#get-started)
- [Manual Guide (Info)](#manual-deply)
- [Manual Guide (Render)](#get-started-1)
- [Manual Guide (Koyeb)](#koyeb)

## Should I use this?

Most likey, **no**. Even though velocity-javaxeagler is more secure than velocity-eagler, it is really unstable and may crash (causing your playit.gg ip to change, which you have to do manually).

## QNA

<ins>**Is it really 24/7?**</ins>

Yes. (If you follow the guide properly)

<ins>**Why isn't support for Koyeb planned?**</ins>

I would update Koyeb but the starter tier requires a credit card, and most people trying to host a eaglercraft server most likey don't. You can use Koyeb using the render branch.

<ins>**Why isn't bedrock supported?**</ins>

Simply it would use too much memory and would make your server crash more often.

## Plans

### Planned:

- None.

### Maybe:

- None.

### Not Planned:

- Support for Minekube (etc.)
- Future Koyeb Support
- Bedrock support

# Blueprints
Introducing blueprints, blueprints make it easier for you to deploy velcoity-javaxeagler!

We currently support 5 regions:

- EU (Frankfurt, Europe)
- AS (Singapore, Asia)
- US-West (Oregon, North America)
- US-East-1 (Ohio, North America)
- US-East-2 (Virgina, North America)

## Get Started

> [!NOTE]
> You will **not** be able to change the *.onrender.com ip (Blueprints only)!

# Manual Deply

## Get Started

<details open> 

<summary>Render</summary>

### Render

Visit [Render](https://dashboard.render.com/)<br>
Login into your account<br>
Click New, then click Web Service<br>
Select Public Git Repository<br>
Connect `https://github.com/devJuban/velocity-javaxeagler-blueprints`<br>
Name your Web Service (the name will be linked to the .onrender.com IP)<br>
Select Docker as the language<br>
Select the render branch<br>
Choose the region closest to you (lower ping)<br>
Select the free plan<br>
You can create 6 environment variables (see below), but only the `SERVER` variable is required.<br>

```
SERVER
MOTD
MAXPLAYERS
RENDER
IMAGE
SECRET
```

<details open>

<summary>Configuring Environment Variables</summary>

#### Configuring Environment Variables

- SERVER - Include your IP (domain/ipv4/ipv6) with the port (eg. domain.tld:&ltPORT&gt (coolserver.com:5000, IPv4/IPv6:&ltPORT&gt (127.0.0.1:25565)).
- MOTD - Recommended using [MCTools](https://mctools.org/motd-creator), copy the BungeeCord MOTD (without the quotes).
- MAXPLAYERS - Any number, althought Velocity does not support a cap on the number of players online.
- RENDER - Your render IP, you get your render IP once you deploy your Web Service.
- IMAGE - Any image off the web, make sure the URL includes .png (**ONLY** .png, eg. imagehosting.platform/admin/servericon.png).
- SECRET - You can click the purple wand to automatically generate a SECRET, not settings one will randomly generate one which will be displayed in the output.

</details>

</details>

> [!CAUTION]
> Koyeb is **no** longer supported, consider switching to [Render](#render)

<details>

<summary>Koyeb</summary>

### Koyeb



</details>