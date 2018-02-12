# dotfiles

this file is ment to be installed as a babushka dep. See [tristan/babushka-deps](https://github.com/tristansokol/babushka-deps)

TODO:
* add check for last babushka'd date and if its been too long run babushka, or display some warning or something.
* Add a curl rc file that sets the user agent to something fun.
* Think about adding a safe sudo

```$ cat ~/bin/safesudo
if [ $# -eq 0 ]; then
  exit
fi
echo "You are about to execute 'sudo $*', are you sure?"
read result
if [ $result = "yes" ]; then
  echo "Running sudo $*"
  `sudo $*`
fi
$ alias sudo=~/bin/safesudo```
