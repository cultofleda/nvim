# `cultofleda/nvim`

## Caveats

### `vue-language-server`

Installing `vue-language-server` through `Mason` is a bit iffy, since it
appears to install an alpha version of the `@vue/language-server` package.

To fix the issue, make sure to edit the following file:

```bash
nvim ~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/package.json
```

Update the dependencies as follows:

```js
{
  "dependencies": {
    "@volar/language-core": "~2.4.0-alpha.18", // change to "2.4.0-alpha.20"
    "@volar/language-server": "~2.4.0-alpha.18", // change to "2.4.0-alpha.20"
  }
}
```
Then run `npm install` in that directory to get the correct package version.

As for the actual LSP configuration, just check the `./lua/plugins/lspconfig.lua` file for further details
