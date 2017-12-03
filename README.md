# gem-nuke
Plugin for gem that will allow you to uninstall all gems except for those that are 'vaulted'.

## Installation
```
$ gem install gem-nuke
```

## Usage
```
$ gem nuke
```
This will uninstall all gems including gem-nuke itself.

```
$ gem nuke --vault bundler,gem-nuke,...

 ```
This will uninstall all gems except for bundler, gem-nuke and others specified as comma separated gem names.

If you don't want to supply `--vault` option every time you run `gem nuke` or just to avoid accidental `nuke` of important gems,
you can set default value for this option by editing your `~/.gemrc` and adding

```
nuke: --vault gem-nuke,bundler,and_or_other_gems 

```
