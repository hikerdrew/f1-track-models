# Installation

Open the repo directory in Terminal

## Install Python

Make sure at least python 3.9.12 is installed

```

python3 --version
```

If it isn't install with homebrew and restart your terminal.
```

brew install python3
```

## Create virutal environment

```

python3 -m venv env 
source env/bin/activate 
python -m pip install -r race_processor/requirements.txt
```

## VSCode Extensions

Install python, and jupyter extensions.

Command Palette: cmd+shift+p

"Python Select Interpreter"
find->race_processor->env->bin->pyton

"New Jupyter Notebook"

# Adding another dpendency

Open repo directory in Terminal.
Activate your env if it isn't already.
```
source env/bin/activate
```

### Add the package to your 'requirements.txt', then reinestall packages.
```

python -m pip install -r race_processor/requirements.txt
```

# How to deactivate you env

```

deactivate
```
This will switch python back to the global version.


# How to add postgres to your PATH

Edit your profile.
```
nano ~/.zprofile
```

Add into this text to export the postgres binaries to your path.
```
export PATH=/Applications/Postgres.app/Contents/Versions/14/bin/:$PATH
```
Save and exit (ctrl+x, then Y, then enter).
Restart terminal.