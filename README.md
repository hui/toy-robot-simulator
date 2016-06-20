Toy Robot Simulator Solution
============================

Models
-------

We need the following models to solve this problem:

1. **Simulator**, the main entrance of the application, which accepts the commands and initialise the **Robot**, place it on the **Table**, pass commands to the **Robot** and get the output result.
2. **Robot**, managed by the **Simulator**, keep the position and direction information, but does not need to know about the details of the **Table**, it asks the **Table** for the next move, if not valid, just stands still.
3. **Table**, holds the movement constraints, it tells the **Robot** if next move is valid, but does not need to know about the **Robot**.


How to run?
-----------

Requires Ruby 2.3 for the **squiggly heredoc**

1. `bundle install` to install minitest and simplecov gems,

2. then `rake` to run the specs.

3. `rake run CMD_FILE=samples/a.txt` will parse `CMD_FILE` and report to standard output.
