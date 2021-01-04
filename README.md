# gcloud-configuration-ohmyzsh-plugin

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

A simple plugin for oh-my-zsh that displays the active gcloud configuration and current quota project for Application
Default Credentials (ADC), if any.

## Why

If you are using `gcloud` directly or indirectly (such as when using Terraform) on multiple projects, you want to use
[named configurations](https://cloud.google.com/sdk/gcloud/reference/topic/configurations) to manage your gcloud
properties. Google lists the following use cases:

> Configurations are especially useful if you:
>
> - Work with multiple projects. You can create a separate configuration for each project.
> - Use multiple accounts, for example, a user account and a service account, etc.
> - Perform generally orthogonal tasks (work on an appengine app in project foo, administer a Google Compute Engine
>   cluster in zone user-central-1a, manage the network configurations for region asia-east-1, etc.)

Named configurations are cool, but they do not account for Application Default Credentials, which are used not by
`gcloud`, but by applications, such as Terraform. The best way to set up ADC locally is by using
`gcloud auth application-default login`. It is usually the case when switching projects that you also want to use a
different account for ADC. If you're like me, you're likely to forget this step and waster valuable minutes figuring out
the issue. Therefore, this plugin also shows the quota project for the ADC as a hint to what account you may have set
for the ADC and determine if you still have ADC from a previous configuration. This is not perfect, but the ADC does not
expose the actual account name.

## Requirement

This plugin depends on [jq](https://stedolan.github.io/jq/). To install it:

- `brew install jq`
- or visit https://stedolan.github.io/jq/download/

## Installation

1. Download the plugin file to the custom plugins well-known location

   ```shell script
   mkdir -p $ZSH_CUSTOM/plugins/gcloudconfig
   curl https://raw.githubusercontent.com/johnmartel/gcloud-configuration-ohmyzsh-plugin/master/gcloudconfig.plugin.zsh -o $ZSH_CUSTOM/plugins/gcloufconfig
   ```

1. Add the plugin to your ZSH configuration

   **`~/.zshrc`**

   ```shell script
   plugins=(git gcloudconfig)
   ```

1. Use `gcloudconfig_prompt_info` in your prompt

   **`~/.zshrc`**

   ```shell script
   PS1='$(kube_ps1) $(gcloudconfig_prompt_info) '$PS1
   ```

1. Source your configuration

   ```shell script
   source ~/.zshrc
   ```
