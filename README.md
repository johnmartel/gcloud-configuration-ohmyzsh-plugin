# gcloud-configuration-ohmyzsh-plugin

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

A simple plugin for oh-my-zsh that displays the active gcloud configuration and current quota project for Application
Default Credentials (ADC), if any.

When switching between configurations, it is useful to see if you still have ADC from a previous configuration.

## Requirement

This plugin depends on [jq](https://stedolan.github.io/jq/). To install it:

- `brew install jq`
- or visit https://stedolan.github.io/jq/download/

## Installation

1. Clone this repository

1. Copy the plugin file to the custom plugins well-known location

   ```shell script
   mkdir -p $ZSH_CUSTOM/plugins/gcloudconfig
   cp gcloudconfig.plugin.zsh $ZSH_CUSTOM/plugins/gcloufconfig
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
