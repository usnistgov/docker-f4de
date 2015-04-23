# docker-f4de
Dockerfile for F4DE

Helps install a Ubuntu 14.04 with the needed tools, install and test F4DE

**To Build**:
In the directory where this `Dockerfile` is:
`% docker build .`

**To Use**:
Adapt <IMAGENAME> and directories:
`% docker run -t -i -v <INDIR>:/f4de_indir:ro -v <OUTDIR>:/f4de_outdir <IMAGENAME> /bin/bash`

