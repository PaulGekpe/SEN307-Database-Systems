SEN307 WEEK 4 PRACTICAL — LAB 2
Student: Paul Kelechi
Matric Number: VUG/SEN/24/12934
Schema: sen307_VUG_SEN_24_12934

FILES
- lab2_erd.png: corrected ER diagram with all six tables and correct relationships.
- lab2_erd.svg: scalable vector version of the same diagram.
- lab2_erd.dot: editable Graphviz source for the diagram.
- lab2_normalization.pdf: normalization write-up covering UNF, 1NF, 2NF, 3NF, keys, and cardinalities.
- lab2_schema.sql: MySQL DDL and supported sample reference data.

IMPORTANT ABOUT THE REQUIRED .MWB FILE
The assignment specifically requires a native MySQL Workbench model named lab2_model.mwb. This file must be saved by MySQL Workbench itself; creating a file with that extension outside Workbench would risk giving you an invalid/corrupt model. Your installed Workbench 26.10.0.0 currently fails during startup, so a valid native .mwb could not be generated here. Do not rename the SQL or SVG to .mwb. The ERD and SQL are consistent and ready to upload, but the native model is the one remaining item to save/export once Workbench is repaired or available on another computer.

GITHUB
Place the deliverables in your repository's week04/ folder. Required names are lab2_model.mwb, lab2_erd.png, and lab2_normalization.pdf. Also include lab2_schema.sql as a helpful supporting file.
Then run from the repository root:
  git add week04/
  git commit -m "Week 4: ER diagram and normalization to 3NF"
  git push
