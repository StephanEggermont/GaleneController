#Galene Controller

Manage a Galene installation with GToolkit
## Installation

```st
Metacello new
	repository: 'github://StephanEggermont/GaleneController:master/src';
	baseline: 'GaleneController';
	load
```

## Load Lepiter

After installing with Metacello, you will be able to execute

```
#BaselineOfGaleneController asClass loadLepiter
```
