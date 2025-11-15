# `cultofleda/nvim`

## Available LSPs

* [`basedpyright`](https://www.npmjs.com/package/basedpyright)
* [`lua-language-server`](https://luals.github.io/#install)
* [`vtsls`](https://www.npmjs.com/package/@vtsls/language-server)
* [`vue-language-server`](https://www.npmjs.com/package/@vue/language-server)
  * with [`@vue/typescript-plugin`](https://www.npmjs.com/package/@vue/typescript-plugin)

### LSP Dependencies

Since I'm keeping the dependencies for the LSP in one place, when migrating this
config to another location/system, just throw down the following `dependencies`
into a `package.json` somewhere and expose the `node_modules/bin` directory to
`PATH` to have them running. No Mason required.

**Note** that `lua-ls` doesn't actually have an NPM package for its language
server.

> ⚠️**TODO:** Perhaps just stick the `package.json` into this repo and have it all
  in one place?

```json
"dependencies": {
  "@vtsls/language-server": "^0.2.9",
  "@vue/language-server": "^3.0.1",
  "@vue/typescript-plugin": "^3.0.1",
  "basedpyright": "^1.31.4"
}
```
