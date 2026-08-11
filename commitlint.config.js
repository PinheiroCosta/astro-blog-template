export default {
  extends: ["@commitlint/config-conventional"],
  rules: {
    "type-enum": [
      2,
      "always",
      [
        "feat",
        "fix",
        "docs",
        "style",
        "refactor",
        "test",
        "chore",
        "revert",
        "ci",
        "perf",
        "build",
      ],
    ],
    "subject-empty": [2, "never"],
  },
};
