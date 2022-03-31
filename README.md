![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
# <p align = "center"><font color = "#33ccff">Akinator game</font></p>
This is my realisation of Akinator game.

# Table of contents:
- [How to clone](#how-to-clone)

- [Dependencies](#dependencies)

- [How to use](#how-to-use)

# How to clone:
```
git clone git@github.com:ajlekcahdp4/Akinator.git
cd Akinator
```

# Dependencies:
## 1) Graphviz

You can instal graphviz by apt or apt-get:
```
sudo apt install graphviz
```
Or by using pacman (On Arch and Manjaro linux)
```
sudo pacman -S graphviz
```

## 2) make
You can install make by apt or apt-get:
```
sudo apt install make
```
Or by using pacman (For Arch and Manjaro linux)
```
sudo pacman -S make
```
# How to use

After [cloning](#how-to-clone) this repsitory, just run
```
make
```
to compile whole project and the use:
```
./Play
```
To start the game.
Then, follow the instractions of the Akinator.
- You can use "y" (yes) or "n" (no) to answer the questions.
- You also can use "q" to quit the game every time you want.

Sage Akinator is very clever and can guess the person you imagine precisely. But even he can't always be right, and there are some cases when he just does not know the person you imagine.
<p align="center">
<img src="https://github.com/ajlekcahdp4/Akinator/blob/main/examples/1.png">
</p>

In this situations you can teach him, folowing his instructions:
<p align="center">
<img src="https://github.com/ajlekcahdp4/Akinator/blob/main/examples/2.png">
</p>
This wise man will remember it and guess it next time.
<p align="center">
<img src="https://github.com/ajlekcahdp4/Akinator/blob/main/examples/3.png">
</p>
