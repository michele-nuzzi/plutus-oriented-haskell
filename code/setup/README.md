# set up

### installing haskell compiler and package manager


#### install ```ghcup```

for more info on what is ```ghcup``` visit https://www.haskell.org/ghcup/
<details open>
<summary>Unix-like</summary>

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

</details>

<details>
<summary>Windows</summary>

on your ```PowerShell```

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true
```

</details>

then run
```bash
source .bashrc
```
( or simply restart your terminal )

and then make sure to have the last version:
```bash
ghcup upgrade
```

#### use ```ghcup``` to install ```cabal```


<details>
<summary>What is ```cabal```</summary>
the package manager of haskell

we'll use it in order to set up a project
</details>

run:
```bash
ghcup install cabal
```

<details>
<summary>If you prefer a specific version</summary>

```bash
ghcup install cabal <your specific version>
ghcup set cabal <your specific version>
```

example for ```3.4.0.0```
```bash
ghcup install cabal 3.4.0.0
ghcup set cabal 3.4.0.0
```
</details>


#### use ```ghcup``` to install ```ghc```


<details>
<summary>What is ```ghc```</summary>

Acronym for

> Glorious
> Haskell
> Compiler

we'll use it in order to compile haskell programs
</details>

run:
```bash
ghcup install ghc
```

<details>
<summary>If you prefer a specific version</summary>

```bash
ghcup install ghc <your specific version>
ghcup set ghc <your specific version>
```

example for ```8.10.4```
```bash
ghcup install ghc 8.10.4
ghcup set ghc 8.10.4
```
</details>


### add the freshly installed executables to your PATH so that you have them avaiable globaly

1) open your ```$HOME/.bashrc``` file and scroll to the bottom
2) add the following to the end of the file

```bash
export PATH="$HOME/.ghcup/bin:$PATH"
```

then restart your shell or run
```bash
source $HOME/.bashrc
```
in order to update the PATH variable

3) check everything is good

check the versions you are using
```bash
ghc --version
cabal --version
```

find the path of your executables
```bash
which ghc
which cabal
```

4) test ghc
```bash
cat << EOF >> test_ghc.hs

main :: IO () 
main = putStrLn "\nI'm working!!!\n"
EOF

ghc test_ghc.hs

./test_ghc
# expected output : I'm working!!!

rm ./test_ghc*

```
