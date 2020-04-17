# add-copyright
This is a **Script to Automate** adding the License or Copyright text to one or more source files **Recursively**. The License or the Copyright texts get added to the top of the source file. Ice on the Cake is, it doesn't duplicate the copyright/license text if it is added already!

Here is an example of JavaScript(.js) file.

```js

/*
 © Copyright 2020 tapasadhikary.com or one of its affiliates.
 * Some Sample Copyright Text
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

# Issues and Limitations

- This tool can only be run from a Linux Bash Shell. For running it from windows use any bash shell like [GitBash](https://git-scm.com/download/win).
- This tool can only be used with the language files where multi-line comment is allowed with this format, like javascript, java etc.:
  ```js
   /*
    This is a comment
   */
  ```
  For example, you shouldn't use this tool for `.html` files.
