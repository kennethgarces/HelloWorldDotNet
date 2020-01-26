
# HelloWorldDotNet

Example .NET package

Created by Kenneth Garces

### Build Status

The current build is V1.0

### Run.sh

Script can be invoked by running Run.sh

### Description

You will be prompted to enter 4 build steps.  The inputs will be read and output to console.  Pipeline will begin executing.  Message Hello World will confirm successful exeuction.

### Result/Test

Script/build steps will be logged to SampleOutput.txt (>> SampleOutput+$(date).txt, examle --> SampleOut-2020_01_25_06_28_pm.log) during Deploy to Test.  If file is not present, do not deploy to Prod, otherwise, deploy to Prod.

### Before you begin

**Delete the file SampleOutput*.txt file*
