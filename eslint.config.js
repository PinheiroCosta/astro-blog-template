import js from "@eslint/js";
import tseslint from "typescript-eslint";
import globals from "globals";
import eslintPluginAstro from "eslint-plugin-astro";
import eslintConfigPrettier from "eslint-config-prettier";

export default [
  js.configs.recommended,
  ...tseslint.configs.recommended,
  ...eslintPluginAstro.configs.recommended,

  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },

  {
    rules: {
      // Exemplo:
      // "astro/no-set-html-directive": "error",
    },
  },
  // A ordem importa, a configuração do prettier precisa ser o ultimo item do array
  // pois ele sobrescreve regras de formatação vindas das configurações anteriores.
  eslintConfigPrettier,
];
