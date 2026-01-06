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
- Koyeb Support
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

Visit [Render](https://dashboard.render.com/)
Login into your account
Click New, then click Web Service
Select Public Git Repository
Connect `https://github.com/devJuban/velocity-javaxeagler-blueprints`
Name your Web Service (the name will be linked to the .onrender.com ip)
Select Docker as the language
Select the render branch
Choose the region closest to you (lower ping)
Select the free plan
You can create 6 environment variables (see below), but only the `SERVER` variable is required.
```
SERVER=[SUBDOMAIN].<DOMAIN>.<TLD>:<PORT>
MOTD=<STR>
MAXPLAYERS=<INT>
RENDER=<STR>
IMAGE=<STR>
SECRET=<STR>
```

# Manual Deply

## Get Started

<details open> 

<summary>Render</summary>

### Render

</details>

> [!CAUTION]
> Koyeb is **no** longer supported, consider switching to [Render](#render)

<details>

<summary>Koyeb</summary>

### Koyeb



</details>