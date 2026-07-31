import js from "@eslint/js";
import tseslint from "typescript-eslint";
import globals from "globals";
import eslintPluginAstro from "eslint-plugin-astro";

export default [
  js.configs.recommended,

  ...tseslint.configs.recommended,

  ...eslintPluginAstro.configs.recommended,

  // Configurações comuns para todo o projeto
  {
    ignores: [".astro/", "dist/", "node_modules"],
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },

  // Espaço reservado para regras específicas do projeto
  {
    rules: {
      // Exemplo:
      // "astro/no-set-html-directive": "error",
    },
  },
];
