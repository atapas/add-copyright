# add-copyright
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors-)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fatapas%2Fadd-copyright.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fatapas%2Fadd-copyright?ref=badge_shield)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
This is a **Script to Automate** adding the Copyright text to one or more source files **Recursively**. The Copyright texts get added to the top of the source file. Ice on the Cake is, it doesn't duplicate the copyright text if it is added already!

Note: The same tool can be used to add any such text blocks like, License, File level Comments etc.

Here is an example of JavaScript(.js) file.

```js

/*
 © Copyright 2020 tapasadhikary.com or one of its affiliates.
 * Some Sample Copyright Text Line
 * Some Sample Copyright Text Line
 * Some Sample Copyright Text Line
 * Some Sample Copyright Text Line
 * Some Sample Copyright Text Line
 * Some Sample Copyright Text Line
*/

const test = () => {
	console.log('test');
}

test();
```

# To Run this on your Source Code

- Clone the project. This project comes with a script file called `addcopyright.sh` and few test files to test out things before you feel comfortable to try it on your source code.
- Browse to the folder where you have cloned the project.
- Change directory to `add-copyright` folder.
- Open a shell or Gitbash or any unix command supported prompt.
- Execute this command:
  ```bash
   export COPYRIGHTLEN=`wc -l copyright.txt | cut -f1 -d ' '`
  ```
  The above command will set some variable value that will be used by the `addcopyright.sh` script.
- Execute the following command to add the copyright/license text from the `copyright.txt` to your source code:
  ```bash
   find <SOURCE_CODE_DIRECTIRY> -type d -name "<EXCLUDE_DIRECTORY>" -prune -o -name "*.js" -print0 | xargs -0 ./addcopyright.sh
  ```
  Where the `<SOURCE_CODE_DIRECTIRY>` is the path of your source code.
  Where the `<EXCLUDE_DIRECTORY>` is the directory to exclude if it exists under `<SOURCE_CODE_DIRECTIRY>` for updating the Copyright information.

# Usage
Make sure you have given the execute permission to the `addcopyright.sh` script file. You can provide the permission using following command:

```bash
chmod +x addcopyright.sh
```
If your user is not having root privileges, add your $USER to 'roots' group using command :
```bash
useradd -m -G root $USER
```
Alternatively: <br/>
Insert 'sudo' when executing the run command. For example:
```bash
 sudo find <SOURCE_CODE_DIRECTIRY> -type d -name "<EXCLUDE_DIRECTORY>" -prune -o -name "*.js" -print0 | sudo xargs -0 ./addcopyright.sh
```
## Running it on Source Code without any Exclusions
For running the tool on the Source code without excluding any folders, use this command:

```bash
find <SOURCE_CODE_DIRECTIRY>  -name "*.js" -print0 | xargs -0 ./addcopyright.sh
```
- For current directory use `.`(dot)
- If your source code is in `/home/atapas/code` directory, use the above command as,
  ```bash
    find <SOURCE_CODE_DIRECTIRY>  -name "*.js" -print0 | xargs -0 ./addcopyright.sh
  ```
  
## Running it on Source Code with Exclusions(Say, node_modules)
For Running the tool on the Source Code by excluding the folder of your desire(say, node_modules for nodeJs based applications), use this command:

  ```bash
   find /opt/atapas/code -type d -name "node_modules" -prune -o -name "*.js" -print0 | xargs -0 ./addcopyright.sh
  ```
### Excluding multiple directories(Say, node_modules and test)
If your source code is in `/home/atapas/code` and want to exclude `node_modules` and `test` directories, use the above command as,
     
  ```bash
     find /opt/atapas/code -type d -name "node_modules" -prune -o -type d -name "test" -prune -o -name "*.js" -print0 | xargs -0 ./addcopyright.sh
  ```

## Change the file Types
To Change the file type, just replace the `*.js` with any other extentions like, `*.java`, `*.cpp` etc.

# Limitations

- This tool can only be run from a Linux Bash Shell. For running it from windows use any bash shell like [GitBash](https://git-scm.com/download/win).
- This tool can be made use for different language files like javascript, java, c, c++, html, shell-script etc. However the content of the `copyright.txt` should be changed according to the mult-line comment format. For example,

  For Javascript(.js) or Java(.java) files this is the format:
 
  ```js
	  
   /*
    This is a comment
   */
   ```
  
  For HTML(.htm or .html) file the format should be,
  
  ```html
	  
  <!-- 
     This is a HTML Comment
  -->
  ```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/IAMLEGION98"><img src="https://avatars2.githubusercontent.com/u/20149005?v=4" width="100px;" alt=""/><br /><sub><b>IAMLEGION98</b></sub></a><br /><a href="https://github.com/atapas/add-copyright/commits?author=IAMLEGION98" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://tapasadhikary.com"><img src="https://avatars1.githubusercontent.com/u/3633137?v=4" width="100px;" alt=""/><br /><sub><b>Tapas Adhikary</b></sub></a><br /><a href="https://github.com/atapas/add-copyright/commits?author=atapas" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/prepaka"><img src="https://avatars3.githubusercontent.com/u/38240616?v=4" width="100px;" alt=""/><br /><sub><b>Pradeep Repaka</b></sub></a><br /><a href="https://github.com/atapas/add-copyright/commits?author=prepaka" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fatapas%2Fadd-copyright.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fatapas%2Fadd-copyright?ref=badge_large)
