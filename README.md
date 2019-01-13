[中文文档](/README-CN.md)

This branch contains the test data and related files needed by other derived libraries.

- If there are any changes to the regular expression, you must update `regex.json` and update the reference versions of all derived libraries to remain consistent with this repository.
- If there are any changes to the prefix, you must update `rules.json`.
- Any updates must re-run `data_generator.py` to generate a new `test_data.json`.
- You must re-run the unit tests for all derived libraries and guaranteed that they pass.

| File | Description |
| --- | --- |
| regex.json | All regular expressions. Need to be consistent with the main branch. All references in the derived library must be consistent with this file. |
| rules.json | All prefixes and related rules. |
| test_data.json |The test data required for the derived library unit test |
| data_generator.py | The script that generates test data. |






