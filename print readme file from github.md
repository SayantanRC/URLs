## Open the required README file (or any other markdown file) in the browser  
Example: https://github.com/SayantanRC/DEREQ/blob/master/README.md  
## Paste the following code  
1. Open developer console (Firefox -> F12)  
2. Click "Console" tab  
3. In Firefox, type `allow pasting`. Do not press enter. Press backspace and erase `allow pasting`.
4. Paste the following content and press Enter key:
  > document.querySelector('#readme').setAttribute('style', 'position: absolute; top: 0; left: 0; right: 0; bottom: 0; z-index: 100; background-color: white')  
  > document.querySelector('body').appendChild(document.querySelector('#readme'))  
  > window.print()  
  
  [Reference](https://gist.github.com/beevelop/a0f2c76e79610dca01550c9a93f83876)  
