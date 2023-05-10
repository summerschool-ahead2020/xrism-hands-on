# How to run the XRISM hands-on notebook on Sciserver

## Create a HEASOFT image on Sciserver

Create a HEASOFT image on Sciserver as explained on [the HEASOFT Sciserver documentation page](https://heasarc.gsfc.nasa.gov/docs/sciserver/).
This notebook has been tested on HEASOFT 6.31.1. And follow [the instructions to create a dedicated conda environment](https://summerschool-ahead2020.github.io/hands-on-sessions/install/install.html#sciserver-setup-recommended).


## Create the working directory

On the Heasoft image, you have your own storage space:
```
(spex) idies@aaaa:~$ cd ~/workspace/Storage/<user>/persistent
```
You can download the notebook and support files using this git command:
```
(spex) idies@aaaa:~/workspace/Storage/<user>/persistent$ git clone https://gitlab.sron.nl/asg/xrism/heasoft-workshop.git
```
Then make the links to the Hitomi data and background files:
```
(spex) idies@aaaa:~/workspace/Storage/<user>/persistent$ cd heasoft-workshop
(spex) idies@aaaa:~/workspace/Storage/<user>/persistent/heasoft-workshop$ ln -s /FTP/hitomi/data/obs/1/100040030 100040030
(spex) idies@aaaa:~/workspace/Storage/<user>/persistent/heasoft-workshop$ ln -s /FTP/hitomi/data/nxb_20170510 NXB  
```

## Running the notebook

For running the Analyze_Perseus notebook, please select the (spex) kernel from the drop down menu on the top right. You need to replace '(heasoft)' with '(spex)'. It may be necessary to restart the image for Jupyter to correctly start the (spex) environment. 

If the (spex) environment is not properly loaded, SPEX will not be able to start. It took me some trouble to make sure that the `(spex)` jupyter kernel also activates the `spex` conda environment. This should be done automatically, but for some reason it was still running in the `heasoft` environment for some time.

We made the following modifications before successfully running it:

- We have added the line `"conda", "run", "--no-capture-output", "-n", "spex",` to this file `~/.local/share/jupyter/kernels/spex/kernel.json` to try to make sure that conda starts the spex conda environment:
```
{
 "argv": [
  "conda", "run", "--no-capture-output", "-n", "spex",  
  "/home/idies/miniconda3/envs/spex/bin/python",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "display_name": "(spex)",
 "language": "python",
 "metadata": {
  "debugger": true
 }
}
```

- We also installed `nb_conda_kernels` into the (heasoft) conda environment: `conda install nb_conda_kernels`.


